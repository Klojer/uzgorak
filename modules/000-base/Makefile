include ../../lib/const.mk ../../lib/cache.mk

INIT_PACKAGES=git curl wget unzip stow build-essential checkinstall

install:
	sudo apt update -y
	sudo apt install -y $(INIT_PACKAGES)
	@echo "Packages installed at $(shell date)" > $(CACHE_DIR)/packages

remove:
	sudo apt remove -y $(INIT_PACKAGES)
	rm $(CACHE_DIR)/packages
