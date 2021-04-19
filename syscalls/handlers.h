#ifndef _MYSYSDIG_HANDLERS_H
#define _MYSYSDIG_HANDLERS_H
#include <asm/ptrace.h>
#define ARGS_BUF_SIZE 200

struct handler_args {
  char* small_buf;
  struct pt_regs* regs;
  long ret;
  HASH_TABLE_ENTER* saved_entry;
};
extern char* get_syscall_name(HASH_TABLE_ENTER*);
// extern inline unsigned long get_arg0(struct pt_regs* regs);
// extern inline unsigned long get_arg1(struct pt_regs* regs);
extern inline unsigned long get_arg2(struct pt_regs* regs);
extern inline unsigned long get_arg3(struct pt_regs* regs);
extern inline unsigned long get_arg4(struct pt_regs* regs);
extern inline unsigned long get_arg5(struct pt_regs* regs);

inline void assemble_buf_arg(char* tmp_buf, const void* buf_addr,
                             const size_t len) {
  size_t tmp = min(len, (size_t)ARGS_BUF_SIZE);
  // NOTE: the buf_addr pointer a user address...
  strncpy_from_user(tmp_buf, buf_addr, tmp);
  tmp_buf[tmp] = '\0';
}

inline int default_handle(struct handler_args* _handler_args) {
  sprintf(_handler_args->small_buf, "pid=%d, %s, res=%ld\n", current->pid,
          get_syscall_name(_handler_args->saved_entry), _handler_args->ret);
  return 0;
}

int getuid_handle(struct handler_args* _handler_args) {
  sprintf(_handler_args->small_buf, "pid=%d, gituid, res=0x%lx\n", current->pid,
          _handler_args->ret);
  return 0;
}

int recvfrom_handle(struct handler_args* _handler_args) {
  int fd = _handler_args->saved_entry->arg0;
  void* buf = (void*)_handler_args->saved_entry->arg1;
  size_t count = get_arg2(_handler_args->regs);
  // NOTE: need ARGS_BUF_SIZE + 1 to save '\0'
  char buf_tmp[ARGS_BUF_SIZE + 1];
  assemble_buf_arg(buf_tmp, buf, _handler_args->ret);
  sprintf(_handler_args->small_buf,
          "pid=%d, recvfrom, fd=%d, size=%ld, res=%ld, data%s=%s\n",
          current->pid, fd, count, _handler_args->ret,
          (_handler_args->ret > ARGS_BUF_SIZE ? "(part)" : ""), buf_tmp);
  return 0;
}

int socket_handle(struct handler_args* _handler_args) {
  int arg1 = _handler_args->saved_entry->arg1;
  int arg2 = get_arg2(_handler_args->regs);
  sprintf(_handler_args->small_buf,
          "pid=%d, socket, domain=%ld, type=%d, protocal=%d, fd=%ld\n",
          current->pid, _handler_args->saved_entry->arg0, arg1, arg2,
          _handler_args->ret);
  return 0;
}

int fstat_handle(struct handler_args* _handler_args) {
  sprintf(_handler_args->small_buf, "pid=%d, fstat, fd=%ld, res=%ld\n",
          current->pid, _handler_args->saved_entry->arg0, _handler_args->ret);
  return 0;
}

int getcwd_handle(struct handler_args* _handler_args) {
  void* res_p = (void*)_handler_args->saved_entry->arg0;
  char buf_tmp[ARGS_BUF_SIZE + 1];
  if (res_p) {
    assemble_buf_arg(buf_tmp, res_p, ARGS_BUF_SIZE);
    sprintf(_handler_args->small_buf, "pid=%d, getcwd, path=%s\n", current->pid,
            buf_tmp);
  } else {
    sprintf(_handler_args->small_buf, "pid=%d, getcwd, ERROR\n", current->pid);
  }
  return 0;
}

int lseek_handle(struct handler_args* _handler_args) {
  int fd = _handler_args->saved_entry->arg0;
  off_t offset = _handler_args->saved_entry->arg1;
  int whence = get_arg2(_handler_args->regs);
  sprintf(_handler_args->small_buf,
          "pid=%d, lseek, fd=%d, offset=%ld, whence=%d, res=%ld\n",
          current->pid, fd, offset, whence, _handler_args->ret);
  return 0;
}

int futex_handle(struct handler_args* _handler_args) {
  uint32_t addr = _handler_args->saved_entry->arg0;
  int futex_op = _handler_args->saved_entry->arg1;
  uint32_t val = get_arg2(_handler_args->regs);
  sprintf(_handler_args->small_buf,
          "pid=%d, futex, addr=%x, op=%d, val=%u, res=%ld\n", current->pid,
          addr, futex_op, val, _handler_args->ret);
  return 0;
}

int sendto_handle(struct handler_args* _handler_args) {
  int sockfd = _handler_args->saved_entry->arg0;
  sprintf(_handler_args->small_buf, "pid=%d, sendto, sockfd=%d, size=%ld\n",
          current->pid, sockfd, _handler_args->ret);
  return 0;
}

int clone_handle(struct handler_args* _handler_args) {
  int pid = _handler_args->ret;
  sprintf(_handler_args->small_buf, "pid=%d, clone, res=%d\n", current->pid,
          pid);
  return 0;
}

int read_handle(struct handler_args* _handler_args) {
  int fd = _handler_args->saved_entry->arg0;
  void* buf = (void*)_handler_args->saved_entry->arg1;
  size_t count = get_arg2(_handler_args->regs);
  // NOTE: need ARGS_BUF_SIZE + 1 to save '\0'
  char buf_tmp[ARGS_BUF_SIZE + 1];
  assemble_buf_arg(buf_tmp, buf, _handler_args->ret);
  sprintf(_handler_args->small_buf,
          "pid=%d, read, fd=%d, size=%ld, res=%ld, data%s=%s\n", current->pid,
          fd, count, _handler_args->ret,
          (_handler_args->ret > ARGS_BUF_SIZE ? "(part)" : ""), buf_tmp);
  return 0;
}

int mmap_handle(struct handler_args* _handler_args) {
  sprintf(_handler_args->small_buf, "pid=%d, mmap, res=0x%lx\n", current->pid,
          _handler_args->ret);
  return 0;
}

int exit_group_handle(struct handler_args* _handler_args) {
  sprintf(_handler_args->small_buf, "pid=%d, exit_group\n", current->pid);
  return 0;
}

int close_handle(struct handler_args* _handler_args) {
  sprintf(_handler_args->small_buf, "pid=%d, close, fd=%d, res=%d\n",
          current->pid, (int)_handler_args->saved_entry->arg0,
          (int)_handler_args->ret);
  return 0;
}

int tgkill_handle(struct handler_args* _handler_args) {
  pid_t tgid = _handler_args->saved_entry->arg0;
  pid_t tid = _handler_args->saved_entry->arg1;
  int sig = get_arg2(_handler_args->regs);
  sprintf(_handler_args->small_buf,
          "pid=%d, tgkill, tgid=%d, tid=%d, sig=%d, _handler_args->ret=%d\n",
          current->pid, tgid, tid, sig, (int)_handler_args->ret);
  return 0;
}

int munmap_handle(struct handler_args* _handler_args) {
  unsigned long addr = _handler_args->saved_entry->arg0;
  size_t length = _handler_args->saved_entry->arg1;
  sprintf(_handler_args->small_buf,
          "pid=%d, munmap, addr=0x%lx, length=%ld, _handler_args->ret=%d\n",
          current->pid, addr, length, (int)_handler_args->ret);
  return 0;
}

int nanosleep_handle(struct handler_args* _handler_args) {
  // struct timespec* req = (void*)_handler_args->saved_entry->arg0;
  // sprintf(_handler_args->small_buf, "pid=%d, nanosleep, interval=%ld\n",
  // current->pid,
  //         req->tv_nsec);
  sprintf(_handler_args->small_buf, "pid=%d, nanosleep\n", current->pid);
  return 0;
}

// need some test...
int ppoll_handle(struct handler_args* _handler_args) {
  // int* fds = (void*)_handler_args->saved_entry->arg0;
  // short* fds2 = (short*)fds;
  // int fd = *fds;
  // sprintf(_handler_args->small_buf, "pid=%d, ppoll, fd=%d, events=%hd,
  // revents=%hd\n",
  //         current->pid, fd, fds2[2], fds2[3]);
  sprintf(_handler_args->small_buf, "pid=%d, ppoll\n", current->pid);
  return 0;
}

int dup_handle(struct handler_args* _handler_args) {
  int oldfd = _handler_args->saved_entry->arg0;
  sprintf(_handler_args->small_buf,
          "pid=%d, dup, oldfd=%d, _handler_args->ret=%d\n", current->pid, oldfd,
          (int)_handler_args->ret);
  return 0;
}

int ioctl_handle(struct handler_args* _handler_args) {
  int fd = _handler_args->saved_entry->arg0;
  unsigned long req = _handler_args->saved_entry->arg1;
  unsigned long argp = get_arg2(_handler_args->regs);
  sprintf(_handler_args->small_buf,
          "pid=%d, ioctl, fd=%d, req=%ld, argp=0x%lx _handler_args->ret=%d\n",
          current->pid, fd, req, argp, (int)_handler_args->ret);
  return 0;
}

int open_handle(struct handler_args* _handler_args) {
  const void* pathname = (void*)_handler_args->saved_entry->arg0;
  const int flags = _handler_args->saved_entry->arg1;
  const mode_t mode = get_arg2(_handler_args->regs);
  char buf_tmp[ARGS_BUF_SIZE + 1];

  assemble_buf_arg(buf_tmp, pathname, ARGS_BUF_SIZE);
  sprintf(_handler_args->small_buf,
          "pid=%d, open, path=%s, flags=%d, mode=%u, _handler_args->ret=%d\n",
          current->pid, buf_tmp, flags, mode, (int)_handler_args->ret);
  return 0;
}

int creat_handle(struct handler_args* _handler_args) {
  const void* pathname = (void*)_handler_args->saved_entry->arg0;
  const mode_t mode = _handler_args->saved_entry->arg1;
  char buf_tmp[ARGS_BUF_SIZE + 1];

  assemble_buf_arg(buf_tmp, pathname, ARGS_BUF_SIZE);
  sprintf(_handler_args->small_buf,
          "pid=%d, creat, path=%s, mode=%u, _handler_args->ret=%d\n",
          current->pid, buf_tmp, mode, (int)_handler_args->ret);
  return 0;
}

int openat_handle(struct handler_args* _handler_args) {
  // dirfd = -100 represents AT_FDCWD (the current work directory) 
  const int dirfd = _handler_args->saved_entry->arg0;
  const void* pathname = (void*)_handler_args->saved_entry->arg1;
  const int flags = get_arg2(_handler_args->regs);
  const mode_t mode = get_arg3(_handler_args->regs);
  char buf_tmp[ARGS_BUF_SIZE + 1];

  assemble_buf_arg(buf_tmp, pathname, ARGS_BUF_SIZE);
  sprintf(_handler_args->small_buf,
          "pid=%d, openat, dir=%d, path=%s, flags=%d, mode=%u, "
          "_handler_args->ret=%d\n",
          current->pid, dirfd, buf_tmp, flags, mode, (int)_handler_args->ret);
  return 0;
}



#endif