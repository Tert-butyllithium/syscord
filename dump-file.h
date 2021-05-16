#ifndef _SYSCORD_DUMP_FILE_H
#define _SYSCORD_DUMP_FILE_H
#include <asm/io.h>
#include <linux/buffer_head.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/mutex.h>
#define WRITE_FILE_LOCK() spin_lock(&buf_lock)
#define WRITE_FILE_UNLOCK() spin_unlock(&buf_lock)
static struct file* __file_to_record = NULL;
// static struct file* __file_to_records[10];
spinlock_t buf_lock;
struct mutex file_write_mutex;

#define BUF_SIZE (1024 * 1024 * 32)

struct file* file_open(const char* path, int flags, int rights) {
  struct file* filp = NULL;
  mm_segment_t oldfs;
  int err = 0;

  // init mutex for write file
  // mutex_init(&file_write_mutex);

  oldfs = get_fs();
  set_fs(KERNEL_DS);
  filp = filp_open(path, flags, rights);
  set_fs(oldfs);
  if (IS_ERR(filp)) {
    err = PTR_ERR(filp);
    return NULL;
  }
  return filp;
}

void close_record_file(void) { filp_close(__file_to_record, NULL); }

static void open_record_file(const char* file_name) {
  // __file_to_record = filp_open(file_name, O_RDWR | O_CREAT, S_IRWXU);
  __file_to_record =
      file_open(file_name, O_RDWR | O_CREAT | O_LARGEFILE, S_IRWXU);
}

int file_write(struct file* file, const char* data, unsigned int size) {
  mm_segment_t oldfs;
  int ret;

  oldfs = get_fs();
  // set_fs(get_ds());
  set_fs(KERNEL_DS);

  ret = kernel_write(file, data, size, &file->f_pos);

  set_fs(oldfs);
  return ret;
}

static void save_to_file(const char* src, const u32 len) {
  static unsigned long times = 0;
  static long index = -1;
  static const unsigned long LIMIT = (1UL << 31) / BUF_SIZE - 1;
  // static const unsigned long LIMIT = 3;
  times++;
  printk("times: %ld, index: %ld", times, index);
  if (times >= LIMIT) {
    index++;
    times = 0;
  }
  // if (index == -1) {
    // printk("write to file: %p",__file_to_record);
    file_write(__file_to_record, src, len);
  // } else {
  //   // printk("write to file: %p",__file_to_records[index]);
  //   file_write(__file_to_records[index], src, len);
  // }
}

#endif
