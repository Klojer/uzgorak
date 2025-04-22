
.PHONY: base/stow/ensure-params
base/stow/ensure-params:
ifndef DIR
	$(error DIR is undefined)
endif

base/stow/install:
	$(MAKE) base/stow/ensure-params
	cd $(DIR) && stow --adopt --target $(HOME) .

base/stow/remove:
	$(MAKE) base/stow/ensure-params
	cd $(DIR) && stow --delete --target $(HOME) .
