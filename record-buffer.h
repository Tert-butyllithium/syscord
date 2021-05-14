#ifndef _SYSCORD_RECORD_BUFFER_H
#define _SYSCORD_RECORD_BUFFER_H
#include <linux/fs.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/version.h>

#include "core-hook.h"
#include "dump-file.h"

#define PROC_MEMSHARE_DIR "memshare"
#define PROC_MEMSHARE_INFO "phymem_info"
#define PROC_MMAP_FILE "mmap"
#define FILE_BASE_DIR "/home/root/syscall-record"

/* alloc one page. 4096 bytes */
#define PAGE_ORDER 2
/* this value can get from PAGE_ORDER */
#define PAGES_NUMBER 4

char real_buffer[BUF_SIZE];
char real_of_real_buffer[BUF_SIZE];
unsigned long real_offset = 0;
unsigned long real_of_real_length = 0;
bool should_real_dump_file = false;
spinlock_t try_dump_real_file_lock;

extern u64 syscall_count;
static bool check_offset(unsigned long str_len) {
  return real_offset + str_len < BUF_SIZE;
}

static void transfer_to_real_of_real_buffer(void) {
  // definitely needs a lock when call it...
  // printk(
  //     "it is time to dump records to file with offset: %ld, current stat:
  //     %lld", real_offset, syscall_count);
  // save_to_file(real_buffer, real_offset);
  memcpy(real_of_real_buffer, real_buffer, real_offset);
  real_of_real_length = real_offset;
  should_real_dump_file = true;
  real_offset = 0;
}

static inline void dump_real_of_real_buffer(void) {
  printk(
      "it is time to dump records to file with offset: %ld, current stat: %lld",
      real_offset, syscall_count);
  save_to_file(real_of_real_buffer, real_of_real_length);
}

static inline void try_dump_real_buffer(void) {
  if (should_real_dump_file) {
    // !!! spin_lock seems work on x86
    spin_lock(&try_dump_real_file_lock);
    if (should_real_dump_file) {
      should_real_dump_file = false;
      dump_real_of_real_buffer();
    }
    spin_unlock(&try_dump_real_file_lock);
  }
}

static void write_something_to_buffer(const char* src,
                                      const unsigned long str_len) {
  unsigned long offset_end = real_offset + str_len;
  memcpy(real_buffer + real_offset, src, str_len);
  real_offset = offset_end;
}

static void __attribute__((unused))
write_something_to_buffer_from_user(const char* src,
                                    const unsigned long str_len) {
  unsigned long offset_end = real_offset + str_len;
  copy_from_user(real_buffer + real_offset, src, str_len);
  real_offset = offset_end;
}

#endif