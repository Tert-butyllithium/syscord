CONFIG_MODULE_SIG=n 
obj-m := syscord.o
ccflags-y += -O2
KDIR := /usr/src/linux-headers-$(shell uname -r)
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
unload:
	sudo rmmod syscord
load:
	sudo insmod  ./syscord.ko proc_name=nginx

reload: unload load

clean:
	make -C $(KDIR) M=$(PWD) clean