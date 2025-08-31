include $(ROOT_DIR)/make/common.mk

LIBS_DIR=$(ROOT_DIR)/src

LIB9=$(LIBS_DIR)/lib9/lib9.a
LIB9P=$(LIBS_DIR)/lib9p/lib9p.a
LIBAUTH=$(LIBS_DIR)/libauth/libauth.a
LIBTHREAD=$(LIBS_DIR)/libthread/libthread.a
LIBDRAW=$(LIBS_DIR)/libdraw/libdraw.a
LIBFRAME=$(LIBS_DIR)/libframe/libframe.a
LIBBIO=$(LIBS_DIR)/libbio/libbio.a
LIBPLUMB=$(LIBS_DIR)/libplumb/libplumb.a
LIB9PCLIENT=$(LIBS_DIR)/lib9pclient/lib9pclient.a
LIBMUX=$(LIBS_DIR)/libmux/libmux.a
LIBCOMPLETE=$(LIBS_DIR)/libcomplete/libcomplete.a
LIBSEC=$(LIBS_DIR)/libsec/libsec.a
LIBMEMLAYER=$(LIBS_DIR)/libmemlayer/libmemlayer.a
LIBMEMDRAW=$(LIBS_DIR)/libmemdraw/libmemdraw.a

LIBS=$(LIBAUTH) $(LIB9P) $(LIBMEMDRAW) $(LIBMEMDRAW) $(LIBMEMDRAW) $(LIBMEMLAYER) $(LIBSEC) $(LIBCOMPLETE) $(LIBFRAME) $(LIBDRAW) $(LIBBIO) $(LIBPLUMB) $(LIBMUX) $(LIB9PCLIENT) $(LIBTHREAD) $(LIB9)

.PHONY: all clean $(CLEAN_EXTRA)
all: $(BIN)
	@:

$(BIN): $(OBJ)
	@echo -e "LINK\t$@" && \
		$(LD) -o $@ $^ $(LIBS) $(LIBS) $(LFLAGS)

include $(ROOT_DIR)/make/compile.mk
 
clean: $(CLEAN_EXTRA)
	@-rm $(OBJ) $(BIN)
