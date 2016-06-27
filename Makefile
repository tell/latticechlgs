include common.mk

.PHONY: all clean

all: $(PREFIX_EXTRA) generators.done
clean:
	-$(MAKE) -C generators clean
	$(RM) *.done

generators.done:
	$(MAKE) -C $(@:%.done=%)
	touch $@
