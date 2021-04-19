#ifndef _MYSYSDIG_HANDLERS_H
#define _MYSYSDIG_HANDLERS_H
#include <asm/ptrace.h>
#define ARGS_BUF_SIZE 200
#define HANDLER_ARGS \
  char *small_buf, struct pt_regs *regs, long ret, HASH_TABLE_ENTER* saved_entry

extern char* get_syscall_name(HASH_TABLE_ENTER*);
// extern inline unsigned long get_arg0(struct pt_regs* regs);
// extern inline unsigned long get_arg1(struct pt_regs* regs);
extern inline unsigned long get_arg2(struct pt_regs* regs);
extern inline unsigned long get_arg3(struct pt_regs* regs);
extern inline unsigned long get_arg4(struct pt_regs* regs);
extern inline unsigned long get_arg5(struct pt_regs* regs);

inline void assemble_buf_arg(char* tmp_buf, void* buf_addr, size_t len) {
  size_t tmp = min(len, (size_t)ARGS_BUF_SIZE);
  // NOTE: the buf_addr pointer a user address...
  strncpy_from_user(tmp_buf, buf_addr, tmp);
  tmp_buf[tmp] = '\0';
}

inline int default_handle(HANDLER_ARGS) {
  sprintf(small_buf, "pid=%d, %s, res=%ld\n", current->pid,
          get_syscall_name(saved_entry), ret);
  return 0;
}

int getuid_handle(HANDLER_ARGS) {
  sprintf(small_buf, "pid=%d, gituid, res=0x%lx\n", current->pid, ret);
  return 0;
}

int recvfrom_handle(HANDLER_ARGS) {
  // int fd = saved_entry->arg0;
  // void* buf = (void*)saved_entry->arg1;
  // size_t count = get_arg2(regs);
  // // NOTE: need ARGS_BUF_SIZE + 1 to save '\0'
  // char buf_tmp[ARGS_BUF_SIZE + 1];
  // assemble_buf_arg(buf_tmp, buf, ret);
  // sprintf(small_buf, "pid=%d, recvfrom, fd=%d, size=%ld, res=%ld,
  // data%s=%s\n",
  //         current->pid, fd, count, ret, (ret > ARGS_BUF_SIZE ? "(part)" :
  //         ""), buf_tmp);
  // return 0;
  int sockfd = saved_entry->arg0;
  sprintf(small_buf, "pid=%d, recvfrom, fd=%d, res=%ld\n", current->pid, sockfd,
          ret);
  return 0;
}

int socket_handle(HANDLER_ARGS) {
  int arg1 = saved_entry->arg1;
  int arg2 = get_arg2(regs);
  sprintf(small_buf,
          "pid=%d, socket, domain=%ld, type=%d, protocal=%d, fd=%ld\n",
          current->pid, saved_entry->arg0, arg1, arg2, ret);
  return 0;
}

int fstat_handle(HANDLER_ARGS) {
  sprintf(small_buf, "pid=%d, fstat, fd=%ld, res=%ld\n", current->pid, saved_entry->arg0,
          ret);
  return 0;
}

int getcwd_handle(HANDLER_ARGS) {
  // size_t size = saved_entry->arg1;
  char* res_p = (void*)ret;
  if (res_p) {
    sprintf(small_buf, "pid=%d, getcwd, path=%s\n", current->pid, res_p);
  } else {
    sprintf(small_buf, "pid=%d, getcwd, ERROR\n", current->pid);
  }
  return 0;
}

int lseek_handle(HANDLER_ARGS) {
  int fd = saved_entry->arg0;
  off_t offset = saved_entry->arg1;
  int whence = get_arg2(regs);
  sprintf(small_buf, "pid=%d, lseek, fd=%d, offset=%ld, whence=%d, res=%ld\n",
          current->pid, fd, offset, whence, ret);
  return 0;
}

int futex_handle(HANDLER_ARGS) {
  uint32_t addr = saved_entry->arg0;
  int futex_op = saved_entry->arg1;
  uint32_t val = get_arg2(regs);
  sprintf(small_buf, "pid=%d, futex, addr=%x, op=%d, val=%u, res=%ld\n",
          current->pid, addr, futex_op, val, ret);
  return 0;
}

int sendto_handle(HANDLER_ARGS) {
  int sockfd = saved_entry->arg0;
  sprintf(small_buf, "pid=%d, sendto, sockfd=%d, size=%ld\n", current->pid,
          sockfd, ret);
  return 0;
}

int clone_handle(HANDLER_ARGS) {
  int pid = ret;
  sprintf(small_buf, "pid=%d, clone, res=%d\n", current->pid, pid);
  return 0;
}

int read_handle(HANDLER_ARGS) {
  int fd = saved_entry->arg0;
  void* buf = (void*)saved_entry->arg1;
  size_t count = get_arg2(regs);
  // NOTE: need ARGS_BUF_SIZE + 1 to save '\0'
  char buf_tmp[ARGS_BUF_SIZE + 1];
  assemble_buf_arg(buf_tmp, buf, ret);
  sprintf(small_buf, "pid=%d, read, fd=%d, size=%ld, res=%ld, data%s=%s\n",
          current->pid, fd, count, ret, (ret > ARGS_BUF_SIZE ? "(part)" : ""),
          buf_tmp);
  return 0;
}

int mmap_handle(HANDLER_ARGS) {
  sprintf(small_buf, "pid=%d, mmap, res=0x%lx\n", current->pid, ret);
  return 0;
}

int exit_group_handle(HANDLER_ARGS) {
  sprintf(small_buf, "pid=%d, exit_group\n", current->pid);
  return 0;
}

int close_handle(HANDLER_ARGS) {
  sprintf(small_buf, "pid=%d, close, fd=%d, res=%d\n", current->pid, (int)saved_entry->arg0,
          (int)ret);
  return 0;
}

int tgkill_handle(HANDLER_ARGS) {
  pid_t tgid = saved_entry->arg0;
  pid_t tid = saved_entry->arg1;
  int sig = get_arg2(regs);
  sprintf(small_buf, "pid=%d, tgkill, tgid=%d, tid=%d, sig=%d, ret=%d\n",
          current->pid, tgid, tid, sig, (int)ret);
  return 0;
}

int munmap_handle(HANDLER_ARGS) {
  unsigned long addr = saved_entry->arg0;
  size_t length = saved_entry->arg1;
  sprintf(small_buf, "pid=%d, munmap, addr=0x%lx, length=%ld, ret=%d\n",
          current->pid, addr, length, (int)ret);
  return 0;
}

int nanosleep_handle(HANDLER_ARGS) {
  // struct timespec* req = (void*)saved_entry->arg0;
  // sprintf(small_buf, "pid=%d, nanosleep, interval=%ld\n", current->pid,
  //         req->tv_nsec);
  sprintf(small_buf, "pid=%d, nanosleep\n", current->pid);
  return 0;
}

// need some test...
int ppoll_handle(HANDLER_ARGS) {
  // int* fds = (void*)saved_entry->arg0;
  // short* fds2 = (short*)fds;
  // int fd = *fds;
  // sprintf(small_buf, "pid=%d, ppoll, fd=%d, events=%hd, revents=%hd\n",
  //         current->pid, fd, fds2[2], fds2[3]);
  sprintf(small_buf, "pid=%d, ppoll\n", current->pid);
  return 0;
}

int dup_handle(HANDLER_ARGS) {
  int oldfd = saved_entry->arg0;
  sprintf(small_buf, "pid=%d, dup, oldfd=%d, ret=%d\n", current->pid, oldfd,
          (int)ret);
  return 0;
}

int ioctl_handle(HANDLER_ARGS) {
  int fd = saved_entry->arg0;
  unsigned long req = saved_entry->arg1;
  unsigned long argp = get_arg2(regs);
  sprintf(small_buf, "pid=%d, ioctl, fd=%d, req=%ld, argp=0x%lx ret=%d\n",
          current->pid, fd, req, argp, (int)ret);
  return 0;
}

#endif