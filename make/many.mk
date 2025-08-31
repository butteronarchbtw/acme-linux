include $(ROOT_DIR)/make/common.mk

.PHONY: $(DIRS) clean $(CLEAN_EXTRA)

$(DIRS):
	@$(MAKE) -C $@

clean: $(CLEAN_EXTRA)
	@for dir in $(DIRS); do \
		$(MAKE) -C $$dir clean; \
	done
