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
#include <trace/events/sched.h>

/**
 * One function per probe. See trace/events/_.h for the arguments
 */
static void probe_sched_switch(void *data, struct task_struct *prev,
                               struct task_struct *next) {
   // Your code here
}

static void probe_sched_wakeup(void *data, struct task_struct *task,
                               int success) {
    // Your code here
}

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
    {.name = "sys_enter", .fct = probe_sched_switch},
    {.name = "sys_exit", .fct = probe_sched_wakeup}, };

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

static void __exit trace_exit(void) { cleanup(); }

static int __init trace_init(void) {
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

    return 0;
}

module_init(trace_init)
module_exit(trace_exit)
MODULE_LICENSE("GPL");