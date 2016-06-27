include common.mk

.PHONY: all clean submods

all: submods generators.done
clean:
	-$(RM) *.done
	-$(MAKE) -C generators clean

submods:
	$(MAKE) -C $@

generators.done:
	$(MAKE) -C $(@:%.done=%)
	touch $@
