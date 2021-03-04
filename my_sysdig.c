// reference: https://gist.github.com/HugoGuiroux/0894091275169750d22f
#include <linux/module.h>
#include <linux/ftrace.h>
#include <linux/tracepoint.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/hashtable.h>
#include <linux/slab.h>
#include <linux/time.h>
#include <linux/percpu.h>
#include <trace/events/syscalls.h>
#include <asm/current.h>

#define _DEBUG_LANRAN_

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Huana Liu");
MODULE_DESCRIPTION("A Linux kenrel module for capturing syscalls");
MODULE_VERSION("0.01");

static int pid = 10;
module_param(pid,int,0644);



#define TRACEPOINT_PROBE(probe, args...) static void probe(void *__data, args)

TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id);
TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret);
TRACEPOINT_PROBE(syscall_procexit_probe, struct task_struct *p);


TRACEPOINT_PROBE(syscall_enter_probe, struct pt_regs *regs, long id)
{

#ifdef _DEBUG_LANRAN_

		printk("[my_sysdig:] syscall 0x%lx, regs[0]=0x%llx, with pid=0x%x",id,regs->regs[0],current->pid);
#else
			long table_index;
	const struct syscall_evt_pair *cur_g_syscall_table = g_syscall_table;
	const enum ppm_syscall_code *cur_g_syscall_code_routing_table = g_syscall_code_routing_table;
	bool compat = false;
#ifdef __NR_socketcall
	int socketcall_syscall = __NR_socketcall;
#else
	int socketcall_syscall = -1;
#endif
	


	g_n_tracepoint_hit_inc();

	table_index = id;
	if (likely(table_index >= 0 && table_index < SYSCALL_TABLE_SIZE)) {
		struct event_data_t event_data;
		int used = cur_g_syscall_table[table_index].flags & UF_USED;
		enum syscall_flags drop_flags = cur_g_syscall_table[table_index].flags;
		enum ppm_event_type type;

		/*
		 * Simple mode event filtering
		 */
		if (g_simple_mode_enabled) {
			if ((drop_flags & UF_SIMPLEDRIVER_KEEP) == 0) {
				return;
			}
		}

#ifdef _HAS_SOCKETCALL
		if (id == socketcall_syscall) {
			used = true;
			drop_flags = UF_NEVER_DROP;
			type = PPME_GENERIC_E;
		} else
			type = cur_g_syscall_table[table_index].enter_event_type;
#else
		type = cur_g_syscall_table[table_index].enter_event_type;
#endif



		event_data.category = PPMC_SYSCALL;
		event_data.event_info.syscall_data.regs = regs;
		event_data.event_info.syscall_data.id = id;
		event_data.event_info.syscall_data.cur_g_syscall_code_routing_table = cur_g_syscall_code_routing_table;
		event_data.socketcall_syscall = socketcall_syscall;
		event_data.compat = compat;
		if (used)
			record_event_all_consumers(type, drop_flags, &event_data);
		else
			record_event_all_consumers(PPME_GENERIC_E, UF_ALWAYS_DROP, &event_data);
	
	}
#endif



}

TRACEPOINT_PROBE(syscall_exit_probe, struct pt_regs *regs, long ret)
{
#ifdef _DEBUG_LANRAN_
		printk("[my_sysdig:] exit syscall, regs[0]=0x%llx, with pid=0x%x, ret=0x%lx",regs->regs[0],current->pid, ret);
#else
	int id;
	long table_index;
	const struct syscall_evt_pair *cur_g_syscall_table = g_syscall_table;
	const enum ppm_syscall_code *cur_g_syscall_code_routing_table = g_syscall_code_routing_table;
	bool compat = false;
#ifdef __NR_socketcall
	int socketcall_syscall = __NR_socketcall;
#else
	int socketcall_syscall = -1;
#endif

	id = syscall_get_nr(current, regs);


	g_n_tracepoint_hit_inc();

	table_index = id - SYSCALL_TABLE_ID0;
	if (likely(table_index >= 0 && table_index < SYSCALL_TABLE_SIZE)) {
		struct event_data_t event_data;
		int used = cur_g_syscall_table[table_index].flags & UF_USED;
		enum syscall_flags drop_flags = cur_g_syscall_table[table_index].flags;
		enum ppm_event_type type;

		/*
		 * Simple mode event filtering
		 */
		if (g_simple_mode_enabled) {
			if ((drop_flags & UF_SIMPLEDRIVER_KEEP) == 0) {
				return;
			}
		}

#ifdef _HAS_SOCKETCALL
		if (id == socketcall_syscall) {
			used = true;
			drop_flags = UF_NEVER_DROP;
			type = PPME_GENERIC_X;
		} else
			type = cur_g_syscall_table[table_index].exit_event_type;
#else
		type = cur_g_syscall_table[table_index].exit_event_type;
#endif

		event_data.category = PPMC_SYSCALL;
		event_data.event_info.syscall_data.regs = regs;
		event_data.event_info.syscall_data.id = id;
		event_data.event_info.syscall_data.cur_g_syscall_code_routing_table = cur_g_syscall_code_routing_table;
		event_data.socketcall_syscall = socketcall_syscall;
		event_data.compat = compat;

		if (used)
			record_event_all_consumers(type, drop_flags, &event_data);
		else
			record_event_all_consumers(PPME_GENERIC_X, UF_ALWAYS_DROP, &event_data);
	}
#endif
}

// TRACEPOINT_PROBE(syscall_procexit_probe, struct task_struct *p)
// {
// 	struct event_data_t event_data;

// 	g_n_tracepoint_hit_inc();

// 	if (unlikely(current->flags & PF_KTHREAD)) {
// 		/*
// 		 * We are not interested in kernel threads
// 		 */
// 		return;
// 	}

// 	event_data.category = PPMC_CONTEXT_SWITCH;
// 	event_data.event_info.context_data.sched_prev = p;
// 	event_data.event_info.context_data.sched_next = p;

// 	record_event_all_consumers(PPME_PROCEXIT_1_E, UF_NEVER_DROP, &event_data);
// }

/**
 * Data structures to store tracepoints informations
 */
struct tracepoints_table {
    const char *name;
    void *fct;
    struct tracepoint *value;
    char init;
};

struct tracepoints_table interests[] = {
    {.name = "sys_enter", .fct = syscall_enter_probe},
    {.name = "sys_exit", .fct = syscall_exit_probe}, };

#define FOR_EACH_INTEREST(i) \
    for (i = 0; i < sizeof(interests) / sizeof(struct tracepoints_table); i++)


/**
 * Tracepoints are not exported (see
 * http://lkml.iu.edu/hypermail/linux/kernel/1504.3/01878.html).
 * This function find the struct tracepoint* associated with a given tracepoint
 * name.
 */
static void lookup_tracepoints(struct tracepoint *tp, void *ignore) {
    int i;
    FOR_EACH_INTEREST(i) {
        if (strcmp(interests[i].name, tp->name) == 0) interests[i].value = tp;
    }
}

static void cleanup(void) {
    int i;

    // Cleanup the tracepoints
    FOR_EACH_INTEREST(i) {
        if (interests[i].init) {
            tracepoint_probe_unregister(interests[i].value, interests[i].fct,
                                        NULL);
        }
    }
}

static void __exit my_sysdig_exit(void) { cleanup(); }

static int __init my_sysdig_init(void) {
    int i;

    // Install the tracepoints
    for_each_kernel_tracepoint(lookup_tracepoints, NULL);

    FOR_EACH_INTEREST(i) {
        if (interests[i].value == NULL) {
            printk("Error, %s not found\n", interests[i].name);
            // Unload previously loaded
            cleanup();
            return -1;
        }

        tracepoint_probe_register(interests[i].value, interests[i].fct, NULL);
        interests[i].init = 1;
    }
    printk(KERN_INFO "[my_sysdig:] load successfully!");

    return 0;
}

module_init(my_sysdig_init)
module_exit(my_sysdig_exit)
MODULE_LICENSE("GPL");