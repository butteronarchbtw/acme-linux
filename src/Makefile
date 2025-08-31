ROOT_DIR=../

BINS_DIR=cmd

DIRS=\
	lib9 \
	lib9p \
	lib9pclient \
	libauth \
	libbio \
	libcomplete \
	libdraw \
	libframe \
	libmemdraw \
	libmemlayer \
	libmux \
	libplumb \
	libsec \
	libthread

.PHONY: $(BINS_DIR)

all: $(BINS_DIR)
	@:

$(BINS_DIR): $(DIRS)
	@$(MAKE) -C $@

CLEAN_EXTRA=$(BINS_DIR)-clean

include $(ROOT_DIR)/make/many.mk

$(BINS_DIR)-clean:
	@$(MAKE) -C $(BINS_DIR) clean
