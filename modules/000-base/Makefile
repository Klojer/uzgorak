include $(LIBS_PATH)/const.mk $(LIBS_PATH)/state.mk

INIT_PACKAGES=git curl wget unzip stow build-essential checkinstall

install:
	sudo apt update -y
	sudo apt install -y $(INIT_PACKAGES)
	@echo "Packages installed at $(shell date)" > $(STATE_DIR)/packages

remove:
	sudo apt remove -y $(INIT_PACKAGES)
	rm $(STATE_DIR)/packages
