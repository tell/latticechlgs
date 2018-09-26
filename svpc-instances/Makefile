.DEFAULT_GOAL := do

ifeq ($(GEN.path),)
export GEN.path = $(realpath ../generators/generate_random)
endif

.PHONY: do
do:

DIRs = svpc_dim-0k svpc_dim-1k svpc_dim-2k
$(DIRs):
	mkdir -p $@
gen-svpc_dim-0k: svpc_dim-0k
	$(MAKE) -f ../generator.mk -C $< all-instances DIM_MIN=40 DIM_MAX=999
gen-svpc_dim-1k: svpc_dim-1k
	$(MAKE) -f ../generator.mk -C $< all-instances DIM_MIN=1000 DIM_MAX=1999
gen-svpc_dim-2k: svpc_dim-2k
	$(MAKE) -f ../generator.mk -C $< all-instances DIM_MIN=2000 DIM_MAX=2100
