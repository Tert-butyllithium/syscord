// reference: https://gist.github.com/HugoGuiroux/0894091275169750d22f
// reference: sysdig
#ifndef _MYSISDIG_CORE_HOOK_H
#define _MYSISDIG_CORE_HOOK_H
#define ENABLE_LOCK
#include <linux/slab.h>
#include <linux/time.h>
#include <linux/tracepoint.h>
#include <trace/events/syscalls.h>

#include "data-structure/hashtable.h"
#include "proc-filter.h"
#include "record-buffer.h"
#include "syscalls/arch.h"
#include "syscalls/handlers.h"
#define TRACEPOINT_PROBE(probe, args...) static void probe(void *__data, args)

spinlock_t buf_lock;
spinlock_t hashtable_lock;
u64 buf_offset = 0;
u64 syscall_count = 0;

struct hashtable proc_arg0_hash_table;
extern int pid;
extern char *proc_name;

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id);
TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret);

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id) {
  // char *name = get_process_name();
  // unsigned long len;
  // char small_buf[128];
  if (check_proc(pid, proc_name, ppid, parent_proc_name) == 0) {
    return;
  }

#ifdef ENABLE_LOCK
  spin_lock(&hashtable_lock);
#endif
  // write_something_to_buffer(small_buf, len);
  hashtable_put(&proc_arg0_hash_table, current->pid,
                (HASH_TABLE_ENTER){id, get_arg0(regs), get_arg1(regs)});
  syscall_count++;
#ifdef ENABLE_LOCK
  spin_unlock(&hashtable_lock);
#endif
}

TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret) {
  // HASH_TABLE_ENTER *record = NULL;
  char small_buf[512];
  struct handler_args _handler_args =
      (struct handler_args){small_buf, regs, ret, NULL};
  int record_partial_flag = 0;
  // char *name = get_process_name();
  unsigned long len;
  bool should_real_dump_file = false;

  if (check_proc(pid, proc_name, ppid, parent_proc_name) == 0) {
    return;
  }

#ifdef ENABLE_LOCK
  spin_lock(&hashtable_lock);
#endif
  // get the info from hash table
  _handler_args.saved_entry =
      hashtable_get(&proc_arg0_hash_table, current->pid);
  if (likely(_handler_args.saved_entry)) {
    hashtable_delete(&proc_arg0_hash_table, current->pid);
  }

  // gen_record_str(small_buf, regs, syscall_no, arg0);
#ifdef ENABLE_LOCK
  spin_unlock(&hashtable_lock);
#endif

  record_partial_flag = gen_record_str(&_handler_args);
  if (record_partial_flag == 0) {
    len = strlen(small_buf);
    WRITE_FILE_LOCK();
    if (!check_offset(len)) {
      transfer_to_real_of_real_buffer();
      should_real_dump_file = true;
    }
    write_something_to_buffer(small_buf, len);
    syscall_count++;
    WRITE_FILE_UNLOCK();
  }

  if(should_real_dump_file){
    dump_real_of_real_buffer();
  }
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
    }
    interests[i].init = 1;
    tracepoint_probe_register(interests[i].value, interests[i].fct, NULL);
  }
}

#endif