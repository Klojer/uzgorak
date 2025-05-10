include ../../lib/const.mk ../../lib/cache.mk
include ../001-bash/include.mk

VERSION=v0.15.0
BASH_ASDF_SH = ". '$$HOME/.asdf/asdf.sh'"
BASH_ASDF_COMPLETEIONS = ". '$$HOME/.asdf/completions/asdf.bash'"

install:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $(VERSION)
	@$(MAKE) bash/eval/to-end VALUE=$(BASH_ASDF_SH)
	@$(MAKE) bash/eval/to-end VALUE=$(BASH_ASDF_COMPLETEIONS)

remove:
	rm -rf ~/.asdf
	@$(MAKE) bash/remove-line VALUE=$(BASH_ASDF_COMPLETEIONS)
	@$(MAKE) bash/remove-line VALUE=$(BASH_ASDF_SH)
