include $(LIBS_PATH)/const.mk $(LIBS_PATH)/state.mk

FONT_VERSION = 3.3.0
FONTS_DIR = $(HOME)/.local/share/fonts/custom
FONTS_LIST = Hack Iosevka SourceCodePro


# Manual how to install Nerd Fonts: https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0
# List of available fonts: https://www.nerdfonts.com/font-downloads
define install-font
$(STATE)/install-$(1):
	@echo "Install font: '$(1)'"

	wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v$(FONT_VERSION)/$(1).zip"
	mkdir -p $(FONTS_DIR)/$(1)
	unzip "$(1).zip" -d "$(FONTS_DIR)/$(1)"
	rm "$(1).zip"
	find "$(FONTS_DIR)/$(1)" -name '*Windows Compatible*' -delete
	fc-cache -fv

	@echo "Font installed at $(shell date)" > $(STATE_DIR)/install-$(1)
endef

$(foreach font, $(FONTS_LIST), $(eval $(call install-font,$(font))))

install: $(foreach font, $(FONTS_LIST), $(STATE)/install-$(font))


define remove-font
$(STATE)/remove-$(1):
	@echo "Remove font: '$(1)'"

	rm -rf $(FONTS_DIR)/$(1)
	fc-cache -fv
	rm -f $(STATE_DIR)/install-$(1)
endef

$(foreach font, $(FONTS_LIST), $(eval $(call remove-font,$(font))))

remove: $(foreach font, $(FONTS_LIST), $(STATE)/remove-$(font))
