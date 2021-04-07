#ifndef _MYSYSDIG_ALL_ARCH
#define _MYSYSDIG_ALL_ARCH
#include "__arm64.h"
#include "__x86_64.h"
#include "handlers.h"

extern char syscall_id_to_name[][32];

// return the name by syscall?
char* get_syscall_name(int id) {
  static unsigned long SYSCALL_TABLE_SIZE =
      sizeof(syscall_id_to_name) / sizeof(syscall_id_to_name[0]);
  if (id >= SYSCALL_TABLE_SIZE) {
    return "unknown";
  }
  return syscall_id_to_name[id];
}

void gen_record_str(char* small_buf, struct pt_regs* regs,
                    unsigned long syscall_no, long ret, unsigned long arg0) {
  unsigned long arg1 = get_arg1(regs);
  // unsigned long arg2 = get_arg2(regs);
  // unsigned long arg3 = get_arg3(regs);
  // unsigned long arg4 = get_arg4(regs);
  // unsigned long arg5 = get_arg5(regs);
  //   sprintf(small_buf,
  //           "pid=%d, %s, ret=0x%lx, arg0=0x%lx, arg1=0x%lx, arg2=0x%lx, "
  //           "arg3=0x%lx ,arg4=0x%lx, arg5=0x%lx, name=%s\n",
  //           current->pid, syscall_id_to_name[syscall_no], res, arg0, arg1,
  //           arg2, arg3, arg4, arg5, current->comm);
  //      printk("%s",small_buf);
  sprintf(small_buf, "pid=%d, %ld, ret=0x%lx, arg0=0x%lx, arg1=0x%lx\n",
          current->pid, syscall_no, ret, arg0, arg1);
  //   printk("%s", small_buf);
}

#endif