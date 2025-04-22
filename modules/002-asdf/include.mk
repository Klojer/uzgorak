
.PHONY: asdf/ensure-params
asdf/ensure-params:
ifndef PLUGIN
	$(error PLUGIN is undefined)
endif
ifndef VERSION
	$(error VERSION is undefined)
endif

asdf/install:
	$(MAKE) asdf/ensure-params
	@bash -i -c "asdf plugin add $(PLUGIN)"
	@bash -i -c "asdf install $(PLUGIN) $(VERSION)"

asdf/global:
	$(MAKE) asdf/ensure-params
	@bash -i -c "asdf global $(PLUGIN) $(VERSION)"

asdf/remove:
	$(MAKE) asdf/ensure-params
	@bash -i -c "asdf uninstall $(PLUGIN) $(VERSION)"
	@bash -i -c "asdf plugin remove $(PLUGIN)"

