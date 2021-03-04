CONFIG_MODULE_SIG=n 
obj-m := my_sysdig.o
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
unload:
	sudo rmmod ./my_sysdig.ko
load:
	sudo insmod  ./my_sysdig.ko

reload: unload load

clean:
	rm -f my_sysdig.o my_sysdig.mod.c my_sysdig.ko my_sysdig.mod.c cscope.out modules.order Module.symvers