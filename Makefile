SRC_DIR=src
MAN_DIR=man

prefix?=/usr/local

bindir=$(DESTDIR)$(prefix)/bin
mandir=$(DESTDIR)$(prefix)/share/man

BINS=\
	$(SRC_DIR)/cmd/9pserve/9pserve \
	$(SRC_DIR)/cmd/acme/acme \
	$(SRC_DIR)/cmd/devdraw/devdraw \
	$(SRC_DIR)/cmd/fontsrv/fontsrv \
	$(SRC_DIR)/cmd/9p/9p \
	$(SRC_DIR)/cmd/9pfuse/9pfuse

INSTALLED_BINS=$(addprefix $(bindir)/, $(notdir $(BINS)))

MAN1S=\
	$(MAN_DIR)/man1/acme.1 \
	$(MAN_DIR)/man1/devdraw.1 \
	$(MAN_DIR)/man1/9p.1

INSTALLED_MAN1S=$(patsubst $(MAN_DIR)/%, $(mandir)/%, $(MAN1S))

MAN4S=\
	$(MAN_DIR)/man4/9pserve.4 \
	$(MAN_DIR)/man4/fontsrv.4 \
	$(MAN_DIR)/man4/9pfuse.4

INSTALLED_MAN4S=$(patsubst $(MAN_DIR)/%, $(mandir)/%, $(MAN4S))

.PHONY: all $(SRC_DIR) install uninstall clean

all: $(SRC_DIR)
	@:

$(SRC_DIR):
	@$(MAKE) -C src

install: all
	install -d $(bindir) $(mandir)/man1 $(mandir)/man4
	install -m 0755 $(BINS) $(bindir)
	install -m 0644 $(MAN1S) $(mandir)/man1
	install -m 0644 $(MAN4S) $(mandir)/man4

uninstall:
	-rm $(INSTALLED_BINS)
	-rm $(INSTALLED_MAN1S)
	-rm $(INSTALLED_MAN4S)

clean:
	@-$(MAKE) -C src clean
