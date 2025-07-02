-include const.mk

all: $(CACHED_INSTALL)

$(CACHED_INSTALL):
	@mkdir -p $(CACHE_DIR)
ifeq ($(TEST_ENV), true)
	@$(MAKE) test-install
endif
	@$(MAKE) install
	@$(MAKE) mark-as-installed-default

$(CACHED_REMOVE):
ifeq ($(TEST_ENV), true)
	@$(MAKE) test-remove
endif
	@$(MAKE) remove
	@$(MAKE) mark-as-removed-default

install-default:
	@echo "Default install logic: Override this in module's Makefile"

test-install-default:
	@echo "Default test-install logic: Override this in module's Makefile"

remove-default:
	@echo "Default remove logic: Override this in module's Makefile"

test-remove-default:
	@echo "Default test-remove logic: Override this in module's Makefile"

mark-as-installed-default:
	@mkdir -p $(CACHE_DIR)
	@echo "Mark as installed at $(shell date)" > $(CACHE_DIR)/$(INSTALL)

mark-as-removed-default:
	@rm -rf $(CACHE_DIR)/$(INSTALL)

%:  %-default
	@  true
