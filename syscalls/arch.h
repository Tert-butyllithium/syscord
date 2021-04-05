#ifndef _MYSYSDIG_ALL_ARCH
#define _MYSYSDIG_ALL_ARCH
#include "__arm64.h"
#include "__x86_64.h"

extern char syscall_id_to_name[][32];

// return the name by syscall?
char* get_syscall_name(int id){
    return syscall_id_to_name[id];
}


#endif