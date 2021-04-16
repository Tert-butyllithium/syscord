#ifndef _MYSYSDIG_HANDLERS_H
#define _MYSYSDIG_HANDLERS_H
#include <asm/ptrace.h>
#define ARGS_BUF_SIZE 200

extern char* get_syscall_name(int);
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

inline void assemble_buf_arg(char* tmp_buf, void* buf_addr, size_t len) {
  size_t tmp = min(len, (size_t)ARGS_BUF_SIZE);
  // NOTE: the buf_addr pointer a user address...
  strncpy_from_user(tmp_buf, buf_addr, tmp);
  tmp_buf[tmp] = '\0';
}

inline int default_handle(char* small_buf, struct pt_regs* regs,
                          unsigned long syscall_no, long ret,
                          unsigned long arg0) {
  sprintf(small_buf, "pid=%d, %s, res=%ld\n", current->pid,
          get_syscall_name(syscall_no), ret);
  return 0;
}

int getuid_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, gituid, res=0x%lx\n", current->pid, ret);
  return 0;
}

int recvfrom_handle(char* small_buf, struct pt_regs* regs,
                    unsigned long syscall_no, long ret, unsigned long arg0) {

  // int fd = arg0;
  // void* buf = (void*)get_arg1(regs);
  // size_t count = get_arg2(regs);
  // // NOTE: need ARGS_BUF_SIZE + 1 to save '\0'
  // char buf_tmp[ARGS_BUF_SIZE + 1];
  // assemble_buf_arg(buf_tmp, buf, ret);
  // sprintf(small_buf, "pid=%d, recvfrom, fd=%d, size=%ld, res=%ld, data%s=%s\n",
  //         current->pid, fd, count, ret, (ret > ARGS_BUF_SIZE ? "(part)" : ""),
  //         buf_tmp);
  // return 0;
  int sockfd = arg0;
  sprintf(small_buf, "pid=%d, recvfrom, fd=%d, res=%ld\n", current->pid, sockfd,
          ret);
  return 0;
}

int socket_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  int arg1 = get_arg1(regs);
  int arg2 = get_arg2(regs);
  sprintf(small_buf,
          "pid=%d, socket, domain=%ld, type=%d, protocal=%d, fd=%ld\n",
          current->pid, arg0, arg1, arg2, ret);
  return 0;
}

int fstat_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, fstat, fd=%ld, res=%ld\n", current->pid, arg0,
          ret);
  return 0;
}

int getcwd_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  // size_t size = get_arg1(regs);
  char* res_p = (void*)ret;
  if (res_p) {
    sprintf(small_buf, "pid=%d, getcwd, path=%s\n", current->pid, res_p);
  } else {
    sprintf(small_buf, "pid=%d, getcwd, ERROR\n", current->pid);
  }
  return 0;
}

int lseek_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  int fd = arg0;
  off_t offset = get_arg1(regs);
  int whence = get_arg2(regs);
  sprintf(small_buf, "pid=%d, lseek, fd=%d, offset=%ld, whence=%d, res=%ld\n",
          current->pid, fd, offset, whence, ret);
  return 0;
}

int futex_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  uint32_t addr = arg0;
  int futex_op = get_arg1(regs);
  uint32_t val = get_arg2(regs);
  sprintf(small_buf, "pid=%d, futex, addr=%x, op=%d, val=%u, res=%ld\n",
          current->pid, addr, futex_op, val, ret);
  return 0;
}

int sendto_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  int sockfd = arg0;
  sprintf(small_buf, "pid=%d, sendto, sockfd=%d, size=%ld\n", current->pid,
          sockfd, ret);
  return 0;
}

int clone_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  int pid = ret;
  sprintf(small_buf, "pid=%d, clone, res=%d\n", current->pid, pid);
  return 0;
}

int read_handle(char* small_buf, struct pt_regs* regs, unsigned long syscall_no,
                long ret, unsigned long arg0) {
  int fd = arg0;
  void* buf = (void*)get_arg1(regs);
  size_t count = get_arg2(regs);
  // NOTE: need ARGS_BUF_SIZE + 1 to save '\0'
  char buf_tmp[ARGS_BUF_SIZE + 1];
  assemble_buf_arg(buf_tmp, buf, ret);
  sprintf(small_buf, "pid=%d, read, fd=%d, size=%ld, res=%ld, data%s=%s\n",
          current->pid, fd, count, ret, (ret > ARGS_BUF_SIZE ? "(part)" : ""),
          buf_tmp);
  return 0;
}

int mmap_handle(char* small_buf, struct pt_regs* regs, unsigned long syscall_no,
                long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, mmap, res=0x%lx\n", current->pid, ret);
  return 0;
}

int exit_group_handle(char* small_buf, struct pt_regs* regs,
                      unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, exit_group\n", current->pid);
  return 0;
}

int close_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  sprintf(small_buf, "pid=%d, close, fd=%d, res=%d\n", current->pid, (int)arg0,
          (int)ret);
  return 0;
}

int tgkill_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  pid_t tgid = arg0;
  pid_t tid = get_arg1(regs);
  int sig = get_arg2(regs);
  sprintf(small_buf, "pid=%d, tgkill, tgid=%d, tid=%d, sig=%d, ret=%d\n",
          current->pid, tgid, tid, sig, (int)ret);
  return 0;
}

int munmap_handle(char* small_buf, struct pt_regs* regs,
                  unsigned long syscall_no, long ret, unsigned long arg0) {
  unsigned long addr = arg0;
  size_t length = get_arg1(regs);
  sprintf(small_buf, "pid=%d, munmap, addr=0x%lx, length=%ld, ret=%d\n",
          current->pid, addr, length, (int)ret);
  return 0;
}

int nanosleep_handle(char* small_buf, struct pt_regs* regs,
                     unsigned long syscall_no, long ret, unsigned long arg0) {
  struct timespec* req = (void*)arg0;
  sprintf(small_buf, "pid=%d, nanosleep, interval=%ld\n", current->pid,
          req->tv_nsec);
  return 0;
}

// need some test...
int ppoll_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  int* fds = (void*)arg0;
  short* fds2 = (short*)fds;
  int fd = *fds;
  sprintf(small_buf, "pid=%d, ppoll, fd=%d, events=%hd, revents=%hd\n",
          current->pid, fd, fds2[2], fds2[3]);
  return 0;
}

int dup_handle(char* small_buf, struct pt_regs* regs, unsigned long syscall_no,
               long ret, unsigned long arg0) {
  int oldfd = arg0;
  sprintf(small_buf, "pid=%d, dup, oldfd=%d, ret=%d\n", current->pid, oldfd,
          (int)ret);
  return 0;
}

int ioctl_handle(char* small_buf, struct pt_regs* regs,
                 unsigned long syscall_no, long ret, unsigned long arg0) {
  int fd = arg0;
  unsigned long req = get_arg1(regs);
  unsigned long argp = get_arg2(regs);
  sprintf(small_buf, "pid=%d, ioctl, fd=%d, req=%ld, argp=0x%lx ret=%d\n",
          current->pid, fd, req, argp, (int)ret);
  return 0;
}

#endif