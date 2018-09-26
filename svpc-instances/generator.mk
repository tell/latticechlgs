ifeq ($(GEN.path),)
$(error GEN.path is not defined)
endif
ifeq ($(DIM_MIN),)
$(error DIM_MIN is not defined)
endif
ifeq ($(DIM_MAX),)
$(error DIM_MAX is not defined)
endif

DIMs = $(shell seq $(DIM_MIN) $(DIM_MAX))
INSTANCEs = $(addprefix svpc_dim-,$(addsuffix _seed-0.txt,$(DIMs)))

define GEN.do
$(GEN.path) --dim $(shell echo $1 | sed -e 's/.*dim-\([0-9]*\)_.*/\1/') --seed 0 > $@.temp
mv -f $@.temp $@
endef

$(INSTANCEs):
	$(call GEN.do,$@)

.PHONY: all-instances
all-instances: $(INSTANCEs)
