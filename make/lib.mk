include $(ROOT_DIR)/make/common.mk

.PHONY: all clean $(CLEAN_EXTRA)
all: $(LIB)
	@:

$(LIB): $(OBJ)
	@echo -e "AR\t$@" && \
		$(AR) rcs $@ $^

include $(ROOT_DIR)/make/compile.mk
 
clean: $(CLEAN_EXTRA)
	@-rm $(OBJ) $(LIB)
