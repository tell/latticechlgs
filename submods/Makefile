include ../common.mk

CXX = g++
ifeq (Darwin,$(shell uname -s))
$(info Detected OS name is Darwin.)
CXX = clang++
endif

.PHONY: all
all: ntl-unix.done

.PHONY: clean
clean:
	$(RM) *.done
	$(RM) -r ntl-build

ntl-unix.done:
	cp -r ntl-unix/ntl ntl-build \
	&& cd ntl-build/src \
	&& ./configure PREFIX=$(NTL_PREFIX) CXX=$(CXX) \
	&& make \
	&& make install
	touch $@
