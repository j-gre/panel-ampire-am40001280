obj-m += panel-ampire-am4001280atzqw00h.o

KDIR ?= "/lib/modules/$(shell uname -r)/build"
PWD := $(shell pwd)
.PHONY = check

all:
	make -C $(KDIR) M=$(PWD) modules_install

clean:
    rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
    rm -f Module.markers Module.symvers modules.order
    rm -rf .tmp_versions Modules.symvers

cfiles = $(obj-m:.o=.c)
check: $(cfiles)
	$(KDIR)/scripts/checkpatch.pl -f --max-line-length=100 $<
