// reference: https://gist.github.com/HugoGuiroux/0894091275169750d22f
// reference: sysdig
#include <asm/current.h>
#include <linux/ftrace.h>
#include <linux/hashtable.h>
#include <linux/module.h>
#include <linux/percpu.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/slab.h>
#include <linux/time.h>
#include <linux/tracepoint.h>
#include <trace/events/syscalls.h>

#include "proc_filter.h"

#define _DEBUG_LANRAN_

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Huana Liu");
MODULE_DESCRIPTION("A Linux kenrel module for capturing syscalls");
MODULE_VERSION("0.01");

static int pid = 0;
static char *proc_name = "";
module_param(pid, int, 0644);
module_param(proc_name, charp, 0000);

unsigned long long get_syscall_res(struct pt_regs *regs) {
#ifdef CONFIG_X86
  return regs->ax;
#elif defined(CONFIG_ARM64)
  return regs->regs[0];
#elif defined(CONFIG_RISCV)
  return regs->a0;
#endif
}

#define TRACEPOINT_PROBE(probe, args...) static void probe(void *__data, args)

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id);
TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret);
// TRACEPOINT_PROBE(syscall_procexit_probe, struct task_struct *p);

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id) {
  char *name = get_process_name();
  if (check_proc(pid, proc_name) == 0) {
    return;
  }

  printk("[my_sysdig:] syscall 0x%lx, with pid=0x%x, name=%s", id, current->pid,
         name);
}

TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret) {
  char *name = get_process_name();
  if (check_proc(pid, proc_name) == 0) {
    return;
  }

  printk(
      "[my_sysdig:] exit syscall, regs[0]=0x%llx, with pid=0x%x, ret=0x%lx, "
      "name=%s",
      get_syscall_res(regs), current->pid, ret, name);
}
/**
 * Data structures to store tracepoints informations
 */
struct tracepoints_table {
  const char *name;
  void *fct;
  struct tracepoint *value;
  char init;
};

struct tracepoints_table interests[] = {
    {.name = "sys_enter", .fct = syscall_enter_probe},
    {.name = "sys_exit", .fct = syscall_exit_probe},
};

#define FOR_EACH_INTEREST(i) \
  for (i = 0; i < sizeof(interests) / sizeof(struct tracepoints_table); i++)

/**
 * Tracepoints are not exported (see
 * http://lkml.iu.edu/hypermail/linux/kernel/1504.3/01878.html).
 * This function find the struct tracepoint* associated with a given tracepoint
 * name.
 */
static void lookup_tracepoints(struct tracepoint *tp, void *ignore) {
  int i;
  FOR_EACH_INTEREST(i) {
    if (strcmp(interests[i].name, tp->name) == 0) interests[i].value = tp;
  }
}

static void cleanup(void) {
  int i;

  // Cleanup the tracepoints
  FOR_EACH_INTEREST(i) {
    if (interests[i].init) {
      tracepoint_probe_unregister(interests[i].value, interests[i].fct, NULL);
      tracepoint_synchronize_unregister();
    }
  }
}

static void __exit my_sysdig_exit(void) {
    cleanup();
    printk("[my_sysdig:] remove my_sysdig successfully");
}

static int __init my_sysdig_init(void) {
  int i;

  // Install the tracepoints
  for_each_kernel_tracepoint(lookup_tracepoints, NULL);

  FOR_EACH_INTEREST(i) {
    if (interests[i].value == NULL) {
      printk("Error, %s not found\n", interests[i].name);
      // Unload previously loaded
      cleanup();
      return -1;
    }
    interests[i].init = 1;
    tracepoint_probe_register(interests[i].value, interests[i].fct, NULL);
  }
  printk(KERN_INFO "[my_sysdig:] load successfully!");
  // then print out the filter condition
  printk(KERN_INFO "[my_sysdig:] pid=%d and proc_name=%s", pid, proc_name);
  printk(KERN_INFO "[my_sysdig:] load successfully!");

  return 0;
}

module_init(my_sysdig_init);
module_exit(my_sysdig_exit);
MODULE_LICENSE("GPL");