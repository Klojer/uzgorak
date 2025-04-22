include ../../common_cache.mk

INIT_PACKAGES=git curl wget unzip stow build-essential checkinstall

$(CACHED)/packages:
	sudo apt update -y
	sudo apt install -y $(INIT_PACKAGES)
	@echo "Packages installed at $(shell date)" > $(CACHED)/packages

FONT_VERSION = 3.3.0
FONTS_DIR = $(HOME)/.local/share/fonts/custom

install-font:
ifndef FONT
	$(error FONT is undefined)
endif
	wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v$(FONT_VERSION)/$(FONT).zip"
	unzip "$(FONT).zip" -d "$(FONTS_DIR)"
	rm "$(FONT).zip"
	find "$(FONTS_DIR)" -name '*Windows Compatible*' -delete
	fc-cache -fv

# Manual how to install Nerd Fonts: https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0
# List of available fonts: https://www.nerdfonts.com/font-downloads
$(CACHED)/fonts:
	@$(MAKE) install-font FONT=Hack
	@$(MAKE) install-font FONT=Iosevka
	@$(MAKE) install-font FONT=SourceCodePro
	@echo "Fonts installed at $(shell date)" > $(CACHED)/fonts

install: $(CACHED)/packages $(CACHED)/fonts

remove/packages:
	sudo apt remove -y $(INIT_PACKAGES)
	rm $(CACHED)/packages

remove/fonts:
	rm -rf $(FONTS_DIR)
	fc-cache -fv
	rm $(CACHED)/fonts

remove: remove/packages remove/fonts
