#ifndef SYSCORD_HANDLERS_TABLE_H
#define SYSCORD_HANDLERS_TABLE_H
#include "handlers.h"
#define SYSCALL_COUNT 512
extern char syscall_id_to_name[][32];

typedef int (*handler_callback)(struct handler_args*);
handler_callback functions[SYSCALL_COUNT];
char handler_string[SYSCALL_COUNT][32];
static int _function_handled_number = 0;
inline static void BIND_HANDLER(const char* str, handler_callback callback) {
  functions[_function_handled_number] = callback;
  strcpy(handler_string[_function_handled_number], str);
  _function_handled_number++;
}

void __bind_handlers(void) {
  BIND_HANDLER("getuid", &getuid_handle);
  BIND_HANDLER("recvfrom", &recvfrom_handle);
  BIND_HANDLER("socket", &socket_handle);
  BIND_HANDLER("fstat", &fstat_handle);
  BIND_HANDLER("getcwd", &getcwd_handle);
  BIND_HANDLER("lseek", &lseek_handle);
  BIND_HANDLER("futex", &futex_handle);
  BIND_HANDLER("sendto", &sendto_handle);
  BIND_HANDLER("clone", &clone_handle);
  BIND_HANDLER("read", &read_handle);
  BIND_HANDLER("mmap", &mmap_handle);
  BIND_HANDLER("exit_group", &exit_group_handle);
  BIND_HANDLER("close", &close_handle);
  BIND_HANDLER("tgkill", &tgkill_handle);
  BIND_HANDLER("munmap", &munmap_handle);
  BIND_HANDLER("nanosleep", &nanosleep_handle);
  BIND_HANDLER("ppoll", &ppoll_handle);
  BIND_HANDLER("dup", &dup_handle);
  BIND_HANDLER("ioctl", &ioctl_handle);
  BIND_HANDLER("open", &open_handle);
  BIND_HANDLER("creat", &creat_handle);
  BIND_HANDLER("openat", &openat_handle);
  BIND_HANDLER("close", &close_handle);
  BIND_HANDLER("writev", &writev_handle);
}

handler_callback syscall_id_handlers[SYSCALL_COUNT];

void init_syscall_id_handlers(void) {
  int i, j;
  const static size_t SYSCALL_TABLE_SIZE =
      sizeof(syscall_id_to_name) / sizeof(syscall_id_to_name[0]);
  __bind_handlers();
  // static size_t HANDLER_TABLE_SIZE = _function_handled_number;
  // sizeof(handler_string) / sizeof(handler_string[0]);
  printk("[syscord:] These following syscalls have been special handled");
  for (i = 0; i < SYSCALL_TABLE_SIZE; i++) {
    for (j = 0; j < _function_handled_number; j++) {
      if (strcmp(syscall_id_to_name[i], handler_string[j]) == 0) {
        syscall_id_handlers[i] = functions[j];
        printk("[syscord:] %d:%s - %pF", i, syscall_id_to_name[i],
               functions[j]);
        goto next_label;
      }
    }
    syscall_id_handlers[i] = &default_handle;
  next_label:;
  }
}

#endif