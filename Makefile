include common.mk

.PHONY: all check clean submods

all: submods generators.done

check:
	$(MAKE) -C generators check

clean:
	-$(RM) *.done
	-$(MAKE) -C generators clean

submods:
	$(MAKE) -C $@

generators.done:
	$(MAKE) -C $(@:%.done=%)
	touch $@
