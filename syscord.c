#include <asm/current.h>
#include <linux/ftrace.h>
#include <linux/module.h>
#include <linux/percpu.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/slab.h>
#include <linux/time.h>
#include <linux/tracepoint.h>
#include <trace/events/syscalls.h>

static int pid = 0;
module_param(pid, int, 0600);
static char *proc_name = "";
module_param(proc_name, charp, 0660);
static int ppid = 0;
module_param(ppid, int, 0600);
static char *parent_proc_name = "";
module_param(parent_proc_name, charp, 0660);

// #include "proc-filter.h"
// #include "dump-file.h"
// #include "record-buffer.h"
#include "core-hook.h"

#define _DEBUG_LANRAN_
#define RECORD_PATH "/etc/syscall-record/record"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Huana Liu");
MODULE_DESCRIPTION("A Linux kenrel module for capturing syscalls");
MODULE_VERSION("0.01");

static void init_files(void) {
  int i = 0;
  char tmp[64];
  open_record_file(RECORD_PATH);

  for (; i < 10; i++) {
    sprintf(tmp, "%s__%02d", RECORD_PATH, i);
    __file_to_records[i] = file_open(tmp, O_RDWR | O_CREAT, S_IRWXU);
  }
}

static void close_files(void) {
  int i = 0;
  transfer_to_real_of_real_buffer();
  dump_real_of_real_buffer();
  close_record_file();
  for (; i < 10; i++) {
    filp_close(__file_to_records[i], NULL);
  }
}

static void __exit syscord_exit(void) {
  printk("statistics: %llu\n", syscall_count);
  printk("saving to file...with length: %lu", real_offset);
#ifdef SYSCORD_DEBUG
  dump_buffer();
#endif
  close_files();
  cleanup();
  printk("[syscord:] remove syscord successfully");
}

static int __init syscord_init(void) {
  init_syscall_id_handlers();
  init_files();
  mutex_init(&file_write_mutex);
  spin_lock_init(&buf_lock);
  spin_lock_init(&hashtable_lock);
  spin_lock_init(&try_dump_real_file_lock);

  register_syscall_hook();
  // then print out the filter condition
  printk(KERN_INFO "[syscord:] pid=%d and proc_name=%s", pid, proc_name);
  printk(KERN_INFO "[syscord:] load successfully!");

  return 0;
}

module_init(syscord_init);
module_exit(syscord_exit);
MODULE_LICENSE("GPL");