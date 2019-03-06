ROOT_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
NTL_PREFIX = $(ROOT_DIR)/module
CXX = g++
ifeq (Darwin,$(shell uname -s))
$(info Detected OS name is Darwin.)
CXX = clang++
endif
