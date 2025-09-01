include $(PWD)/lib/const.mk

VERSION = 0.5.0

LIBS_PATH := $(PWD)/lib
export LIBS_PATH

MODULES_PATH ?= ./modules

MODULES_DEFAULT := $(shell find $(MODULES_PATH) -type f -name 'Makefile' -exec dirname {} \; | xargs -n1 basename)
ifeq ($(MODULES),)
	MODULES := $(MODULES_DEFAULT)
endif

MODULES_SORTED = $(shell printf "%s\n" $(MODULES) | sort)
MODULES_REVERSED = $(shell printf "%s\n" $(MODULES) | sort -r)

.PHONY: all
all: install

.PHONY: install
install:
	@for mod in $(MODULES_SORTED); do \
		$(MAKE) -s module/install/$$mod || exit $$?; \
	done

.PHONY: remove
remove:
	@for mod in $(MODULES_REVERSED); do \
		$(MAKE) -s module/remove/$$mod || exit $$?; \
	done

.PHONY: mark-as-installed
mark-as-installed:
	@for mod in $(MODULES_SORTED); do \
		$(MAKE) -s module/mark-as-installed/$$mod || exit $$?; \
	done

.PHONY: mark-as-removed
mark-as-removed:
	@for mod in $(MODULES_REVERSED); do \
		$(MAKE) -s module/mark-as-removed/$$mod || exit $$?; \
	done

define module-install
.PHONY: module/install/$(1)
module/install/$(1):
	@$(MAKE) -s module/process MOD=$(1) TASK=$(STATE_INSTALL)
endef

$(foreach mod, $(MODULES_SORTED), $(eval $(call module-install,$(mod))))

define module-remove
.PHONY: module/remove/$(1)
module/remove/$(1):
	@$(MAKE) -s module/process MOD=$(1) TASK=$(STATE_REMOVE)
endef

$(foreach mod, $(MODULES_SORTED), $(eval $(call module-remove,$(mod))))

define module-mark-as-installed
.PHONY: module/mark-as-installed/$(1)
module/mark-as-installed/$(1):
	@$(MAKE) -s module/process MOD=$(1) TASK=mark-as-installed
endef

$(foreach mod, $(MODULES_SORTED), $(eval $(call module-mark-as-installed,$(mod))))

define module-mark-as-removed
.PHONY: module/mark-as-removed/$(1)
module/mark-as-removed/$(1):
	@$(MAKE) -s module/process MOD=$(1) TASK=mark-as-removed
endef

$(foreach mod, $(MODULES_SORTED), $(eval $(call module-mark-as-removed,$(mod))))


module/process:
ifndef TASK
	$(error TASK is undefined)
endif
ifndef MOD
	$(error MOD is undefined)
endif
	@if [ ! -d "$(MODULES_PATH)/$(MOD)" ]; then \
		echo "Module [$(MODULES_PATH)/$(MOD)] does not exist"; \
		exit 1; \
	fi
	@if [ ! -f "$(MODULES_PATH)/$(MOD)/.ignore" ]; then \
		echo "Exec task [$(TASK)] in module [$(MOD)]"; \
		$(MAKE) -s -C $(MODULES_PATH)/$(MOD) $(TASK); \
	else \
		echo "Skipping module [$(MOD)] (marked as ignored)"; \
	fi;

.PHONY: list
list:
	@for mod in $(MODULES_SORTED); do \
		install_status=""; \
		ignore_status=""; \
		if [ -f "$(MODULES_PATH)/$$mod/$(STATE_DIR)/install" ]; then \
			install_status="installed;"; \
		fi; \
		if [ -f "$(MODULES_PATH)/$$mod/.ignore" ]; then \
			ignore_status="ignored;"; \
		fi; \
		if [ -n "$$install_status" ] || [ -n "$$ignore_status" ]; then \
			echo "Module [$$mod] ($$install_status$$ignore_status)"; \
		else \
			echo "Module [$$mod]"; \
		fi; \
	done

.PHONY: version
version:
	@echo $(VERSION)


.PHONY: test
test:
	@$(MAKE) -f tests/test.mk

.PHONY: test/shell
test/shell:
	@$(MAKE) -f tests/test.mk docker/shell

.PHONY: test-pipeline
test-pipeline:
	@$(MAKE) -s install
	@$(MAKE) -s list
	@$(MAKE) -s remove
	@$(MAKE) -s list

