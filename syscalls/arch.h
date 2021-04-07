#ifndef _MYSYSDIG_ALL_ARCH
#define _MYSYSDIG_ALL_ARCH
#include "__arm64.h"
#include "__x86_64.h"
#include "handlers-table.h"
#include "handlers.h"

extern char syscall_id_to_name[][32];
extern handler_callback syscall_id_handlers[512];
const unsigned long SYSCALL_TABLE_SIZE =
    sizeof(syscall_id_to_name) / sizeof(syscall_id_to_name[0]);
// return the name by syscall number
char* get_syscall_name(int id) {
  if (id >= SYSCALL_TABLE_SIZE) {
    return "unknown";
  }
  return syscall_id_to_name[id];
}

extern void init_syscall_id_handlers(void);

void gen_record_str(char* small_buf, struct pt_regs* regs,
                    unsigned long syscall_no, long ret, unsigned long arg0) {
  if (syscall_no >= SYSCALL_TABLE_SIZE) {
    default_handle(small_buf, regs, syscall_no, ret, arg0);
  } else {
    syscall_id_handlers[syscall_no](small_buf, regs, syscall_no, ret, arg0);
  }
}

#endif