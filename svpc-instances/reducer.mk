.DEFAULT_GOAL := show

INSTANCEs = $(notdir $(shell ls -1 svpc_*.txt))
BASENAME_INSTANCEs = $(basename $(INSTANCEs))
define LLL.do
fplll -a lll $(shell echo $1 | sed -e 's/\.lll//') > $@.temp
mv -f $@.temp $@
endef
LLL_INSTANCEs = $(addsuffix .lll,$(INSTANCEs))
$(LLL_INSTANCEs):
	$(call LLL.do,$@)
.PHONY: lll-all
lll-all: $(LLL_INSTANCEs)

define BKZ.do
inputfname=$(shell echo $1 | sed -e 's/\.bkz[0-9]*//'); \
blocksize=$(shell echo $1 | sed -e 's/.*bkz\([0-9]*\).*/\1/'); \
fplll -a bkz -b $$blocksize $$inputfname > $@.temp
mv -f $@.temp $@
endef
BKZ10_INSTANCEs = $(addsuffix .bkz10,$(INSTANCEs))
BKZ20_INSTANCEs = $(addsuffix .bkz20,$(INSTANCEs))
$(BKZ10_INSTANCEs) $(BKZ20_INSTANCEs):
	$(call BKZ.do,$@)
.PHONY: bkz10-all
bkz10-all: $(BKZ10_INSTANCEs)
.PHONY: bkz20-all
bkz20-all: $(BKZ20_INSTANCEs)

.PHONY: show
show:
	$(info INSTANCEs = $(INSTANCEs))
	$(info LLL_INSTANCEs = $(LLL_INSTANCEs))
