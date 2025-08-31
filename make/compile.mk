%.o: %.c
	@echo -e "CC\t$@" && \
		$(CC) -o $@ -c $< -I$(ROOT_DIR)/include -DPLAN9_TARGET=\"$(PLAN9)\" $(CFLAGS)
