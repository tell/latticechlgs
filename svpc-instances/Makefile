.DEFAULT_GOAL := do

ifeq ($(GEN.path),)
export GEN.path = $(realpath ../generators/generate_random)
endif

.PHONY: do
do: ## The default target, do nothing.
.PHONY: clean
clean:
	find . -iname '*.temp' -or -iname 'core.*' -delete
.PHONY: help
help: ## Print help texts of goals.
	@grep -h -E '^[[:alnum:][:punct:]_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

DIRs = svpc_dim-0k svpc_dim-1k svpc_dim-2k
$(DIRs):
	mkdir -p $@
gen-svpc_dim-0k: svpc_dim-0k ## A target.
	$(MAKE) -f ../generator.mk -C $< all-instances DIM_MIN=40 DIM_MAX=999
gen-svpc_dim-1k: svpc_dim-1k ## A target.
	$(MAKE) -f ../generator.mk -C $< all-instances DIM_MIN=1000 DIM_MAX=1999
gen-svpc_dim-2k: svpc_dim-2k ## A target.
	$(MAKE) -f ../generator.mk -C $< all-instances DIM_MIN=2000 DIM_MAX=2100
.PHONY: do-gen
do-gen: gen-svpc_dim-0k gen-svpc_dim-1k gen-svpc_dim-2k ## All the targets.
.PHONY: do-lll
lll-svpc_dim-0k: svpc_dim-0k ## A target.
	$(MAKE) -f ../reducer.mk -C $< lll-all
do-lll: lll-svpc_dim-0k ## All the target of LLL.
bkz10-svpc_dim-0k: svpc_dim-0k ## A target.
	$(MAKE) -f ../reducer.mk -C $< bkz10-all
bkz20-svpc_dim-0k: svpc_dim-0k ## A target.
	$(MAKE) -f ../reducer.mk -C $< bkz20-all
do-bkz10: bkz10-svpc_dim-0k ## All the target of BKZ-10.
do-bkz20: bkz20-svpc_dim-0k ## All the target of BKZ-10.
