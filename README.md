# My sysdig

> The *goal* of this project is to create another `sysdig` ~~(although impossible)~~

Sysdig is an awesome tool for capturing syscalls; however, it was intentionally developed for `x86_64` platform and not very suitable for `arm` devices (especially for developing board without package manager)

`My sysdig` aims to provide limited features to minimize dependencies and overhead (But lack of relevant tests)

> WARNING: This is developing project and all functions haven't been tested. 

## User Manual 

Basically, you can `make` to compile the driver and then `insmod my_sysdig.ko` to install the kernel module. 

Then you could run `dmesg -w` to find all syscall logs. 

```bash
[  139.506484] [my_sysdig:] syscall 0x0, with pid=0xc36, name=dmesg
[  139.506485] [my_sysdig:] exit syscall, regs[0]=0xfffffffffffffffe, with pid=0xce1, ret=0xfffffffffffffffe, name=systemd-udevd
[  139.506485] [my_sysdig:] exit syscall, regs[0]=0x48, with pid=0x21e, ret=0x48, name=systemd-journal
[  139.506491] [my_sysdig:] syscall 0x101, with pid=0x21e, name=systemd-journal
[  139.506491] [my_sysdig:] syscall 0x101, with pid=0xce1, name=systemd-udevd
[  139.506492] [my_sysdig:] exit syscall, regs[0]=0x61, with pid=0xc36, ret=0x61, name=dmesg
[  139.506495] [my_sysdig:] exit syscall, regs[0]=0xfffffffffffffffe, with pid=0x21e, ret=0xfffffffffffffffe, name=systemd-journal
[  139.506497] [my_sysdig:] exit syscall, regs[0]=0x7, with pid=0xce1, ret=0x7, name=systemd-udevd
[  139.506498] [my_sysdig:] syscall 0x1, with pid=0xc36, name=dmesg
```




### Filter condition

- `pid`: `insmod my_sysdig.ko pid=1234`
- `proc_name`: `insmod my_sysdig.ko proc_name=test_syscall`

Note: because of the constraint of Linux, we will only compare the first 15 characters of `proc_name`

## TO-DO List

-[ ] record parameter changes for all types of syscall
-[ ] capture interrupt...
-[ ] using buffer instead of outputing to `dmesg`