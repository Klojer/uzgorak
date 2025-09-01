include $(LIBS_PATH)/const.mk $(LIBS_PATH)/state.mk
include ../000-base/include.mk
include ../001-bash/include.mk
include ../002-asdf/include.mk

PLUGIN=starship
VERSION=1.22.1

STARSHIP_HOOK = 'eval "$$$$(starship init bash)"'

install:
	@$(MAKE) asdf/install PLUGIN=$(PLUGIN) VERSION=$(VERSION)
	@$(MAKE) asdf/global PLUGIN=$(PLUGIN) VERSION=$(VERSION)
	@$(MAKE) bash/eval/to-end VALUE=$(STARSHIP_HOOK)
	@$(MAKE) base/stow/install DIR=./stow

remove:
	@$(MAKE) base/stow/remove DIR=./stow
	@$(MAKE) bash/remove-line VALUE=$(STARSHIP_HOOK)
	@$(MAKE) asdf/remove/version PLUGIN=$(PLUGIN) VERSION=$(VERSION)
	@$(MAKE) asdf/remove/plugin PLUGIN=$(PLUGIN)
