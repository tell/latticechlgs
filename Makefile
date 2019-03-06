include common.mk

.PHONY: all check submods
all: submods generators.done

check:
	$(MAKE) -C generators check

.PHONY: clean
clean:
	-$(RM) *.done
	-$(MAKE) -C generators clean
	-$(MAKE) -C submods clean

submods:
	$(MAKE) -C $@

generators.done:
	$(MAKE) -C $(@:%.done=%)
	touch $@
