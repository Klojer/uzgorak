
CACHED = .cache
INSTALL = install

all: $(CACHED)/$(INSTALL)

$(CACHED)/$(INSTALL):
	mkdir -p $(CACHED)
	$(MAKE) install
	$(MAKE) mark-as-installed-default

install-default:
	@echo "Default install logic: Override this in module's Makefile"

remove-default:
	@echo "Default remove logic: Override this in module's Makefile"

remove-pipeline: remove mark-as-removed-default

mark-as-installed-default:
	mkdir -p $(CACHED)
	@echo "Mark as installed at $(shell date)" > $(CACHED)/$(INSTALL)

mark-as-removed-default:
	rm -rf $(CACHED)/$(INSTALL)

%:  %-default
	@  true
