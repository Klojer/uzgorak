include ../../lib/const.mk ../../lib/cache.mk
include ./include.mk

BASHRC_PATH_LOCAL_BIN = 'PATH=$(HOME)/.local/bin:$$$$PATH'
BASHRC_EDITOR = 'export EDITOR=vi'

$(CACHED)/bashrc:
	cp $(SHELL_RC_FILE) $(SHELL_RC_FILE).bak
	echo "" >> $(SHELL_RC_FILE)
	echo "$(BEGIN_OF_ALIASES)" >> $(SHELL_RC_FILE)
	echo "$(END_OF_ALIASES)" >> $(SHELL_RC_FILE)
	echo "" >> $(SHELL_RC_FILE)
	echo "$(BEGIN_OF_ENV_VARS)" >> $(SHELL_RC_FILE)
	echo "$(END_OF_ENV_VARS)" >> $(SHELL_RC_FILE)
	echo "" >> $(SHELL_RC_FILE)
	echo "$(BEGIN_OF_EVALS)" >> $(SHELL_RC_FILE)
	echo "$(END_OF_EVALS)" >> $(SHELL_RC_FILE)
	@echo "bashrc configured at $(shell date)" > $(CACHE_DIR)/bashrc

$(CACHED)/env-vars:
	@$(MAKE) bash/env-var/to-end VALUE=$(BASHRC_PATH_LOCAL_BIN)
	@$(MAKE) bash/env-var/to-end VALUE=$(BASHRC_EDITOR)
	@echo "bashrc env-vars configured at $(shell date)" > $(CACHE_DIR)/env-vars

install: $(CACHED)/bashrc $(CACHED)/env-vars

remove-env-vars:
	@$(MAKE) bash/remove-line VALUE=$(BASHRC_EDITOR)
	@$(MAKE) bash/remove-line VALUE=$(BASHRC_PATH_LOCAL_BIN)
	rm $(CACHE_DIR)/env-vars

remove-bashrc:
	cp $(SHELL_RC_FILE) $(SHELL_RC_FILE).tmp
	cp $(SHELL_RC_FILE).bak $(SHELL_RC_FILE)
	mv $(SHELL_RC_FILE).tmp $(SHELL_RC_FILE).bak
	rm $(CACHE_DIR)/bashrc

remove: remove-env-vars remove-bashrc
