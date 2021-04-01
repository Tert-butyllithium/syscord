// reference:
// https://stackoverflow.com/questions/36762974/how-to-use-mmapproc-shared-memory-between-kernel-and-userspace
#include "remapping-driver.h"

#include <linux/fs.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/version.h>

#define PROC_MEMSHARE_DIR "memshare"
#define PROC_MEMSHARE_INFO "phymem_info"
#define PROC_MMAP_FILE "mmap"

/* alloc one page. 4096 bytes */
#define PAGE_ORDER 2
/* this value can get from PAGE_ORDER */
#define PAGES_NUMBER 4
#define BUF_SIZE (1024)

struct proc_dir_entry *proc_memshare_dir;
unsigned long kernel_memaddr = 0;
unsigned long kernel_memsize = 0;

int proc_mmap(struct file *filp, struct vm_area_struct *vma) {
  unsigned long page;
  page = virt_to_phys((void *)kernel_memaddr) >> PAGE_SHIFT;

  if (remap_pfn_range(vma, vma->vm_start, page, (vma->vm_end - vma->vm_start),
                      vma->vm_page_prot)) {
    printk("remap failed...");
    return -1;
  }
  vma->vm_flags |= (VM_DONTDUMP | VM_DONTEXPAND);
  printk("remap_pfn_rang page:[%lu] ok.\n", page);
  return 0;
}

static int proc_show_meminfo(struct seq_file *m, void *v) {
  seq_printf(m, "%08lx %lu\n", __pa(kernel_memaddr), kernel_memsize);
  return 0;
}

static int proc_open_meminfo(struct inode *inode, struct file *file) {
  return single_open(file, proc_show_meminfo, NULL);
}

static const struct file_operations read_phymem_info_fops = {
    .owner = THIS_MODULE,
    .open = proc_open_meminfo,
    .read = seq_read,
    .llseek = seq_lseek,
    .release = seq_release};

static const struct file_operations proc_mmap_fops = {.owner = THIS_MODULE,
                                                      .mmap = proc_mmap};

static void write_something(const char *src, int *offset) {
  char *buffer_addr = kernel_memaddr;
  unsigned long str_len = strlen(src) + 1;
  unsigned long str_end = (*offset) + str_len;

  if(str_end > BUF_SIZE){
    *offset = 0;
    str_end = str_len;
  }
  strncpy(buffer_addr + (*offset), src, str_len);
  *offset = str_end;
}


static int init_remapping(void) {
  /* build proc dir "memshare"and two proc files: phymem_addr, phymem_size in
   * the dir */
  proc_memshare_dir = proc_mkdir(PROC_MEMSHARE_DIR, NULL);
  proc_create_data(PROC_MEMSHARE_INFO, 0, proc_memshare_dir,
                   &read_phymem_info_fops, NULL);
  proc_create_data(PROC_MMAP_FILE, 0, proc_memshare_dir, &proc_mmap_fops, NULL);

  /* alloc one page */
  kernel_memaddr = __get_free_pages(GFP_KERNEL, PAGE_ORDER);
  if (!kernel_memaddr) {
    printk("Allocate memory failure!/n");
  } else {
    SetPageReserved(virt_to_page(kernel_memaddr));
    kernel_memsize = PAGES_NUMBER * PAGE_SIZE;
    printk("Allocate memory success!. The phy mem addr=%08lx, size=%lu\n",
           __pa(kernel_memaddr), kernel_memsize);
  }
  return 0;
}

static void exit_remapping(void) {
  printk("The content written by user is: %s\n",
         (unsigned char *)kernel_memaddr);
  ClearPageReserved(virt_to_page(kernel_memaddr));
  free_pages(kernel_memaddr, PAGE_ORDER);
  remove_proc_entry(PROC_MEMSHARE_INFO, proc_memshare_dir);
  remove_proc_entry(PROC_MMAP_FILE, proc_memshare_dir);
  remove_proc_entry(PROC_MEMSHARE_DIR, NULL);
  return;
}

static void dump_buffer(void) {
  char tmp_buf[128];
  unsigned long offset = 0;
  int a;
  char *buffer_addr = (void *)kernel_memaddr;
  strncpy(tmp_buf, buffer_addr, sizeof tmp_buf);
  // for (; offset < sizeof tmp_buf; offset += strlen(tmp_buf + offset)) {
  //   printk("%s", tmp_buf + offset);
  // }
  // printk("%s",tmp_buf);
  offset = 0;

  while (1) {
    printk("%s\n", tmp_buf + offset);
    a = strlen(tmp_buf + offset);
    if (a == 0) {
      break;
    }
    offset += a + 1;
  }
}