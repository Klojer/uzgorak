include ../../lib/const.mk ../../lib/cache.mk
include ../002-asdf/include.mk

PLUGIN=java
VERSION_LTS=openjdk-21.0.2
VERSION_LATEST=openjdk-24.0.1

install:
	@$(MAKE) asdf/install PLUGIN=$(PLUGIN) VERSION=$(VERSION_LTS)
	@$(MAKE) asdf/install PLUGIN=$(PLUGIN) VERSION=$(VERSION_LATEST)
	@$(MAKE) asdf/global PLUGIN=$(PLUGIN) VERSION=$(VERSION_LTS)

remove:
	@$(MAKE) asdf/remove/version PLUGIN=$(PLUGIN) VERSION=$(VERSION_LATEST)
	@$(MAKE) asdf/remove/version PLUGIN=$(PLUGIN) VERSION=$(VERSION_LTS)
	@$(MAKE) asdf/remove/plugin PLUGIN=$(PLUGIN)
