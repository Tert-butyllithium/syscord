CONFIG_MODULE_SIG=n 
obj-m := my_sysdig.o
# my_sysdig-objs := my_sysdig.o remapping-driver.o
ccflags-y += -O2
KDIR := /usr/src/linux-headers-$(shell uname -r)
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
unload:
	sudo rmmod my_sysdig
load:
	sudo insmod  ./my_sysdig.ko proc_name=nginx

reload: unload load

clean:
	make -C $(KDIR) M=$(PWD) clean