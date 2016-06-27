include ../common.mk

SRCS = $(wildcard *.cpp)
DEST = $(SRCS:%.cpp=%)

ifneq ($(MAKECMDGOALS),clean)
ifeq (1,$(shell test -d "$(NTL_PREFIX)" || echo 1))
$(error Not found: NTL_PREFIX="$(NTL_PREFIX)")
endif
endif

CXXFLAGS += -g3 -O0 -Wall
CPPFLAGS += -I $(NTL_PREFIX)/include
LDFLAGS += -L $(NTL_PREFIX)/lib
LDLIBS += -lntl -lgmp -lm

.PHONY: all check clean

all: ${DEST}

check:
	./generate_random --dim 128 --seed 0 > test.txt && cmp test.txt testvecs/svpchallengedim128seed0.txt
	./generate_ideal --index 256 --seed 0 > test.txt && cmp test.txt testvecs/ideallatticedim128index256seed0.txt

clean:
	$(RM) ${DEST} *~

