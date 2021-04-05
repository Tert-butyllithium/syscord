#ifndef _MYSYSDIG_HANDLERS_H
#define _MYSYSDIG_HANDLERS_H
#include <asm/ptrace.h>

unsigned long get_arg0(){
#ifdef CONFIG_X86
  return regs->ax;
#elif defined(CONFIG_ARM64)
  return regs->regs[0];
#elif defined(CONFIG_RISCV)
  return regs->a0;
#else
  return -1;
#endif
}

int get_syscall_no(){
#ifdef CONFIG_X86
  return regs->ax;
#elif defined(CONFIG_ARM64)
  return regs->regs[0];
#elif defined(CONFIG_RISCV)
  return regs->a0;
#else
  return -1;
#endif
}

unsigned long long get_syscall_res(struct pt_regs *regs) {
#ifdef CONFIG_X86
  return regs->ax;
#elif defined(CONFIG_ARM64)
  return regs->regs[0];
#elif defined(CONFIG_RISCV)
  return regs->a0;
#else
  return -1;
#endif
}

#endif