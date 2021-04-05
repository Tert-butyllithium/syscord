#ifndef _MYSYSDIG_HANDLERS_H
#define _MYSYSDIG_HANDLERS_H
#include <asm/ptrace.h>

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

inline int get_syscall_no(struct pt_regs* regs) {
#ifdef CONFIG_X86
  return regs->ax;
#elif defined(CONFIG_ARM64)
  return regs->regs[8];
#elif defined(CONFIG_RISCV)
  return regs->a7;
#else
  return -1;
#endif
}

inline unsigned long get_syscall_res(struct pt_regs* regs) {
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

#endif