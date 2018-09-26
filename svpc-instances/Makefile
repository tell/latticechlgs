.DEFAULT_GOAL := do

DIMs = $(shell seq 100 2000)
INSTANCEs = $(addprefix svpc_dim-,$(addsuffix _seed-0.txt,$(DIMs)))

.PHONY: do
do:
	$(info Dimensions: $(DIMs))

define GEN.do
../generators/generate_random --dim $1 --seed 0 > $@
endef

$(INSTANCEs):
	$(call GEN.do,$(shell echo $@ | sed -e 's/.*dim-\([0-9]*\)_.*/\1/'))
all-instances: $(INSTANCEs)
