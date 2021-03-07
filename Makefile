CONFIG_MODULE_SIG=n 
obj-m := my_sysdig.o
KDIR := /usr/src/linux-headers-$(shell uname -r)
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
unload:
	sudo rmmod ./my_sysdig.ko
load:
	sudo insmod  ./my_sysdig.ko

reload: unload load

clean:
	make -C $(KDIR) M=$(PWD) clean