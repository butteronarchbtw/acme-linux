ROOT_DIR=../../..

OBJ=\
	devdraw.o\
	latin1.o\
	mouseswap.o\
	srv.o\
	winsize.o \
	x11-alloc.o \
	x11-cload.o \
	x11-draw.o \
	x11-fill.o \
	x11-get.o \
	x11-keysym2ucs.o \
	x11-load.o \
	x11-pixelbits.o \
	x11-screen.o \
	x11-unload.o

BIN=devdraw

CLEAN_EXTRA=extra-clean

include $(ROOT_DIR)/make/bin.mk

LFLAGS+=-lX11

latin1.o: latin1.h

latin1.h: mklatinkbd
	@echo -e "KBD\t$@" && \
		./mklatinkbd -r $(ROOT_DIR)/lib/keyboard | sed 's/, }/ }/' | sed "s/\(0x[0-9]\+\)x/\1/g" > $@ 

mklatinkbd: mklatinkbd.o 
	@echo -e "LINK\t$@" && \
		$(LD) -o $@ $< $(LIBS)

extra-clean:
	@-rm latin1.h
	@-rm mklatinkbd
	@-rm mklatinkbd.o
