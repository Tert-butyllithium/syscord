#ifndef _MYSYSDIG_HANDLERS_H
#define _MYSYSDIG_HANDLERS_H
#include <asm/ptrace.h>
#define ARGS_BUF_SIZE 450

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

int getuid_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, gituid, %lx\n", current->pid, ret);
  return 0;
}

int recvfrom_handle(char* small_buf, struct pt_regs* regs,
                    unsigned long syscall_no, long ret, unsigned long arg0) {
  int sockfd = arg0;
  sprintf(small_buf, "pid=%d, recvfrom, %lx, fd=%d\n", current->pid, ret, sockfd);
  return 0;
}

int set_robust_list_handle(char* small_buf, struct pt_regs* regs,
                           unsigned long syscall_no, long ret,
                           unsigned long arg0) {
  sprintf(small_buf, "pid=%d, set_robust_list\n", current->pid);
  return 0;
}

int rt_sigtimedwait_handle(char* small_buf, struct pt_regs* regs,
                           unsigned long syscall_no, long ret,
                           unsigned long arg0) {
  sprintf(small_buf, "pid=%d, rt_sigtimedwait\n", current->pid);
  return 0;
}

int socket_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  int arg1 = get_arg1(regs);
  int arg2 = get_arg2(regs);
  sprintf(small_buf, "pid=%d, socket, domain=%ld, type=%d, protocal=%d, fd=%ld\n",
          current->pid, arg0, arg1, arg2, ret);
  return 0;
}

int fstat_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, fstat, fd=%ld, res=%ld\n", current->pid, arg0, ret);
  return 0;
}

// int rt_sigtimedwait_handle(char* small_buf, struct pt_regs* regs,
//                            unsigned long syscall_no, long ret,
//                            unsigned long arg0) {
//   sprintf(small_buf, "pid=%d, rt_sigtimedwait\n", current->pid);
//   return 0;
// }

int getcwd_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, getcwd\n", current->pid);
  return 0;
}

#endif