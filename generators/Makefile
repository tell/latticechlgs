SRCS=$(wildcard *.cpp)
DEST=$(SRCS:%.cpp=%)

ifneq ($(MAKECMDGOALS),clean)
ifeq (1,$(shell test -d "$(NTL_PREFIX)" || echo 1))
$(error Not found: NTL_PREFIX="$(NTL_PREFIX)")
endif
endif

CXXFLAGS += -g3 -O0 -Wall
CPPFLAGS += -I $(NTL_PREFIX)/include
LDFLAGS += -L $(NTL_PREFIX)/lib
LDLIBS += -lntl -lgmp -lm

all: ${DEST}

clean:
	$(RM) ${DEST} *~

