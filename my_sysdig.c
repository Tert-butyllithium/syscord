// reference: https://gist.github.com/HugoGuiroux/0894091275169750d22f
// reference: sysdig
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

#include "proc_filter.h"
#include "remapping-driver.c"
#include "core-hook.h"

#define _DEBUG_LANRAN_

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Huana Liu");
MODULE_DESCRIPTION("A Linux kenrel module for capturing syscalls");
MODULE_VERSION("0.01");

static void __exit my_sysdig_exit(void) {

  // dump_buffer();
  printk("statistics: %llu\n", syscall_count);
  printk("saving to file...with length: %lu",real_offset);
  save_to_file(real_buffer, real_offset);
  exit_remapping();
  cleanup();
  close_record_file();
  printk("[my_sysdig:] remove my_sysdig successfully");
}

static int __init my_sysdig_init(void) {
  // int i;
  // buffer init
  init_remapping();
  open_record_file("/etc/syscall-record/record");
  spin_lock_init(&small_buf_lock);


  register_syscall_hook();

  printk(KERN_INFO "[my_sysdig:] load successfully!");
  // then print out the filter condition
  printk(KERN_INFO "[my_sysdig:] pid=%d and proc_name=%s", pid, proc_name);
  printk(KERN_INFO "[my_sysdig:] load successfully!");

  return 0;
}

module_init(my_sysdig_init);
module_exit(my_sysdig_exit);
MODULE_LICENSE("GPL");