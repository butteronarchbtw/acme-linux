ROOT_DIR=../../..

OBJ=\
	main.o\
	pjw.o\
	x11.o

BIN=fontsrv

include $(ROOT_DIR)/make/bin.mk

CFLAGS+=-I/usr/include/freetype2
LFLAGS+=-lX11 -lfontconfig -lfreetype -lz -lm
