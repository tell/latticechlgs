include common.mk

.PHONY: all clean

all: $(PREFIX_EXTRA) generators.done
clean:
	-$(RM) *.done
	-$(MAKE) -C generators clean

generators.done:
	$(MAKE) -C $(@:%.done=%)
	touch $@
