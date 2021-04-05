#ifndef _MYSISDIG_DUMP_FILE_H
#define _MYSISDIG_DUMP_FILE_H
#include <asm/io.h>
#include <linux/buffer_head.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/mutex.h>
#define WRITE_FILE_LOCK() mutex_lock_interruptible(&file_write_mutex)
#define WRITE_FILE_UNLOCK() mutex_unlock(&file_write_mutex)
static struct file* __file_to_record = NULL;
struct mutex file_write_mutex;


struct file* file_open(const char* path, int flags, int rights) {

  struct file* filp = NULL;
  mm_segment_t oldfs;
  int err = 0;

  // init mutex for write file
  mutex_init(&file_write_mutex);

  oldfs = get_fs();
  set_fs(get_ds());
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
  __file_to_record = file_open(file_name, O_RDWR | O_CREAT, S_IRWXU);
}

int file_write(struct file* file, const char* data, unsigned int size) {
  mm_segment_t oldfs;
  int ret;

  oldfs = get_fs();
  set_fs(get_ds());

  ret = kernel_write(file, data, size, &__file_to_record->f_pos);

  set_fs(oldfs);
  return ret;
}

static void save_to_file(const char* src, const u32 len) {
  file_write(__file_to_record, src, len);
}

#endif