// reference: https://gist.github.com/HugoGuiroux/0894091275169750d22f
// reference: sysdig
#ifndef _MYSISDIG_CORE_HOOK_H
#define _MYSISDIG_CORE_HOOK_H
#define ENABLE_LOCK
#include <linux/slab.h>
#include <linux/time.h>
#include <linux/tracepoint.h>
#include <trace/events/syscalls.h>

#include "proc-filter.h"
#include "record-buffer.h"
#define TRACEPOINT_PROBE(probe, args...) static void probe(void *__data, args)

spinlock_t small_buf_lock;
u64 buf_offset = 0;
u64 syscall_count = 0;
extern int pid;
extern char *proc_name;

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id);
TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret);
// TRACEPOINT_PROBE(syscall_procexit_probe, struct task_struct *p);

unsigned long long get_syscall_res(struct pt_regs *regs) {
#ifdef CONFIG_X86
  return regs->ax;
#else
  return regs->regs[0];
#endif
}

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id) {
  char *name = get_process_name();
  unsigned long len;
  char small_buf[128];
  if (check_proc(pid, proc_name) == 0) {
    return;
  }

  // memset(small_buf,0,sizeof small_buf);

  sprintf(small_buf, "syscall 0x%lx, with pid=0x%x, name=%s\n", id,
          current->pid, name);
  // write_something(small_buf, &buf_offset);
  len = strlen(small_buf);
  if (!check_offset(len)) {
    // dump to file
    WRITE_FILE_LOCK();
    if (!check_offset(len)) {
      dump_to_file();
    }
     WRITE_FILE_UNLOCK();
  }

#ifdef ENABLE_LOCK
  spin_lock_irq(&small_buf_lock);
#endif
  write_something_to_buffer(small_buf, len);

  syscall_count++;
#ifdef ENABLE_LOCK
  spin_unlock_irq(&small_buf_lock);
#endif
}

TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret) {
  char *name = get_process_name();
  unsigned long len;
  char small_buf[128];
  if (check_proc(pid, proc_name) == 0) {
    return;
  }

  // memset(small_buf,0,sizeof small_buf);

  sprintf(small_buf,
          "exit syscall, regs[0]=0x%llx, with pid=0x%x, ret=0x%lx, name=%s\n",
          get_syscall_res(regs), current->pid, ret, name);
  len = strlen(small_buf);
  if (!check_offset(len)) {
    // dump to file
    WRITE_FILE_LOCK();
    if (!check_offset(len)) {
      dump_to_file();
    }
    WRITE_FILE_UNLOCK();
  }

#ifdef ENABLE_LOCK
  spin_lock_irq(&small_buf_lock);
#endif
  write_something_to_buffer(small_buf, len);
  syscall_count++;
#ifdef ENABLE_LOCK
  spin_unlock_irq(&small_buf_lock);
#endif
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

static void register_syscall_hook(void) {
  // Install the tracepoints
  int i;
  for_each_kernel_tracepoint(lookup_tracepoints, NULL);

  FOR_EACH_INTEREST(i) {
    if (interests[i].value == NULL) {
      printk("Error, %s not found\n", interests[i].name);
      // Unload previously loaded
      cleanup();
      // return -1;
    }
    interests[i].init = 1;
    tracepoint_probe_register(interests[i].value, interests[i].fct, NULL);
  }
}

// static void unregister_syscall_hook(void) {
//   int i;

//   // Cleanup the tracepoints
//   FOR_EACH_INTEREST(i) {
//     if (interests[i].init) {
//       tracepoint_probe_unregister(interests[i].value, interests[i].fct,
//       NULL); tracepoint_synchronize_unregister();
//     }
//   }
// }

#endif