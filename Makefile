
VERSION = 0.1.0

MODULES_PATH = ./modules

MODULES := $(shell find $(MODULES_PATH) -type f -name 'Makefile' -exec dirname {} \; | xargs -n1 basename)
MODULES_SORTED = $(shell printf "%s\n" $(MODULES) | sort)
MODULES_REVERSED = $(shell printf "%s\n" $(MODULES) | sort -r)

.PHONY: all
all: install

.PHONY: install
install:
	@for mod in $(MODULES_SORTED); do \
		$(MAKE) -s module/install MOD=$$mod; \
	done

.PHONY: remove
remove:
	@for mod in $(MODULES_REVERSED); do \
		$(MAKE) -s module/remove MOD=$$mod; \
	done

.PHONY: mark-as-installed
mark-as-installed:
	@for mod in $(MODULES_SORTED); do \
		$(MAKE) -s module/mark-as-installed MOD=$$mod; \
	done

.PHONY: mark-as-removed
mark-as-removed:
	@for mod in $(MODULES_REVERSED); do \
		$(MAKE) -s module/mark-as-removed MOD=$$mod; \
	done

.PHONY: module/install
module/install:
	$(MAKE) -s module/process TASK=.cache/install

.PHONY: module/remove
module/remove:
	$(MAKE) -s module/process TASK=remove-pipeline

.PHONY: module/mark-as-installed
module/mark-as-installed:
	$(MAKE) -s module/process TASK=mark-as-installed

.PHONY: module/mark-as-removed
module/mark-as-removed:
	$(MAKE) -s module/process TASK=mark-as-removed

.PHONY: module/process
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
		if [ -f "$(MODULES_PATH)/$$mod/.cache/install" ]; then \
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
