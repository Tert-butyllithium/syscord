#ifndef _REMAPPING_DRIVER
#define _REMAPPING_DRIVER

static int init_remapping(void);
static void exit_remapping(void);
static void write_something(const char *,u64*);
static void dump_buffer(void);
#endif