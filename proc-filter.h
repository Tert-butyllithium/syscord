#ifndef _MYSISDIG_PROC_FILTER_H
#define _MYSISDIG_PROC_FILTER_H
#include <linux/sched.h>

const size_t MAX_STR_LENGTH = 15;
char* get_process_name(void);
unsigned check_proc_exclusive(char*);

u8 check_proc_pid(int pid) { return pid == current->pid; }

// only get first 15 characters
char* get_process_name() { return current->comm; }

u8 check_proc_name(char* proc_name) {
  char* cur_proc_name = get_process_name();
  // if(check_proc_exclusive(cur_proc_name)){
  //     return 0;
  // }
  int cmp_max_len = min(strlen(proc_name), MAX_STR_LENGTH);
  return strncmp(cur_proc_name, proc_name, cmp_max_len) == 0;
}

u8 check_proc(int pid, char* proc_name) {
  if (pid) {
    return check_proc_pid(pid);
  }
  if (strcmp(proc_name, "")) {
    return check_proc_name(proc_name);
  }
  return 1;
}

// const char* NAME_ECLUSIVE[] = {"dmesg", NULL};

// unsigned check_proc_exclusive(char* name) {
//   unsigned i;
//   for (i = 0; NAME_ECLUSIVE[i]; i++) {
//     if (strncmp(NAME_ECLUSIVE[i], name, strlen(NAME_ECLUSIVE[i])) == 0) {
//       return 1;
//     }
//   }
//   return 0;
// }

#endif