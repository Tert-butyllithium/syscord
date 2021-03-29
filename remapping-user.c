// Reference: https://stackoverflow.com/questions/36762974/how-to-use-mmapproc-shared-memory-between-kernel-and-userspace

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/mman.h>

int main(int argc, char *argv[])
{
    char str[256];
    // if (argc != 2) {
    //     printf("Usage: %s string\n", argv[0]);
    //     return 0;
    // }

    unsigned long phymem_addr, phymem_size;
    char *map_addr;
    char s[256];
    int fd;

    /*get the physical address & size of allocated memory in kernel*/
    fd = open("/proc/memshare/phymem_info", O_RDONLY);
    if (fd < 0)
    {
        printf("cannot open file /proc/memshare/phymem_info\n");
        return 0;
    }
    read(fd, s, sizeof(s));
    sscanf(s, "%lx %lu", &phymem_addr, &phymem_size);
    close(fd);

    printf("phymem_addr=%lx, phymem_size=%lu\n", phymem_addr, phymem_size);
    /*memory map*/
    int map_fd = open("/proc/memshare/mmap", O_RDWR | O_SYNC);
    if (map_fd < 0)
    {
        printf("cannot open file /proc/memshare/mmap\n");
        return -1;
    }
    map_addr = mmap(NULL, phymem_size, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, phymem_addr);
    if (map_addr == MAP_FAILED)
    {
        perror("mmap");
        printf("MAP_FAILED : %s", map_addr);
        close(map_fd);
        return -1;
    }
    else
    {
        printf("mmap size: %d \n", strlen(map_addr));
        printf("addr: %p \n", map_addr);
        printf("addr: %d \n", *map_addr);
    }
    //memcpy(map_addr, argv[1],sizeof(argv));
    // strcpy(map_addr,argv[1]);
    // memcpy(str,map_addr,256);

    // printf("str is :%s \n",str);
    int ret = munmap(map_addr, phymem_size);
    if (ret)
    {
        printf("munmap failed:%d \n", ret);
    }
    close(map_fd);
    return 0;
}