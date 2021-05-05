#ifndef _MYSYSDIG_ALL_ARCH
#define _MYSYSDIG_ALL_ARCH
#include "__arm64.h"
#include "__x86_64.h"
#include "handlers-table.h"
#include "handlers.h"
#include "__fast_sprintf.h"


inline unsigned long get_arg0(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->di;
#elif defined(CONFIG_ARM64)
  return regs->regs[0];
#elif defined(CONFIG_RISCV)
  return regs->a0;
#else
  return -1;
#endif
}

inline unsigned long get_arg1(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->si;
#elif defined(CONFIG_ARM64)
  return regs->regs[1];
#elif defined(CONFIG_RISCV)
  return regs->a1;
#else
  return -1;
#endif
}

inline unsigned long get_arg2(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->dx;
#elif defined(CONFIG_ARM64)
  return regs->regs[2];
#elif defined(CONFIG_RISCV)
  return regs->a2;
#else
  return -1;
#endif
}

inline unsigned long get_arg3(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->r10;
#elif defined(CONFIG_ARM64)
  return regs->regs[3];
#elif defined(CONFIG_RISCV)
  return regs->a3;
#else
  return -1;
#endif
}

inline unsigned long get_arg4(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->r8;
#elif defined(CONFIG_ARM64)
  return regs->regs[4];
#elif defined(CONFIG_RISCV)
  return regs->a4;
#else
  return -1;
#endif
}

inline unsigned long get_arg5(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->r9;
#elif defined(CONFIG_ARM64)
  return regs->regs[5];
#elif defined(CONFIG_RISCV)
  return regs->a5;
#else
  return -1;
#endif
}


inline unsigned long get_return_address(struct pt_regs* regs) {
#ifdef CONFIG_X86
// NOT IMPLEMENTED FOR x86
  return 0;
#elif defined(CONFIG_ARM64)
  return regs->regs[30];
#elif defined(CONFIG_RISCV)
  return regs->ra;
#else
  return -1;
#endif
}


extern char syscall_id_to_name[][32];
extern handler_callback syscall_id_handlers[512];
const unsigned long SYSCALL_TABLE_SIZE =
    sizeof(syscall_id_to_name) / sizeof(syscall_id_to_name[0]);

// return the name by syscall number
char* get_syscall_name(HASH_TABLE_ENTER* saved_entry) {
  if (saved_entry== NULL || saved_entry->no >= SYSCALL_TABLE_SIZE ) {
    return "unknown";
  }
  return syscall_id_to_name[saved_entry->no];
}

extern void init_syscall_id_handlers(void);

int gen_record_str(struct handler_args* _handler_args) {
  if(_handler_args->saved_entry == NULL){
    return default_handle(_handler_args);
  } else {
    return syscall_id_handlers[_handler_args->saved_entry->no](_handler_args);
  }
}

#endif