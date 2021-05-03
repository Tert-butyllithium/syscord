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

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Huana Liu");
MODULE_DESCRIPTION("A Linux kenrel module for capturing syscalls");
MODULE_VERSION("0.01");

static void __exit my_sysdig_exit(void) {
  printk("statistics: %llu\n", syscall_count);
  printk("saving to file...with length: %lu", real_offset);
#ifdef MYSYSDIG_DEBUG
  dump_buffer();
#endif
  dump_to_file();
  cleanup();
  close_record_file();
  printk("[my_sysdig:] remove my_sysdig successfully");
}

static int __init my_sysdig_init(void) {
  init_syscall_id_handlers();
  open_record_file("/etc/syscall-record/record");
  spin_lock_init(&buf_lock);
  spin_lock_init(&hashtable_lock);

  register_syscall_hook();
  // then print out the filter condition
  printk(KERN_INFO "[my_sysdig:] pid=%d and proc_name=%s", pid, proc_name);
  printk(KERN_INFO "[my_sysdig:] load successfully!");

  return 0;
}

module_init(my_sysdig_init);
module_exit(my_sysdig_exit);
MODULE_LICENSE("GPL");