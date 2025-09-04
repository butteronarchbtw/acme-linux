SRC_DIR=src
MAN_DIR=man

prefix?=/usr/local

bindir=$(DESTDIR)$(prefix)/bin
mandir=$(DESTDIR)$(prefix)/share/man

-include config.mk

INSTALLED_BINS=$(addprefix $(bindir)/, $(notdir $(BINS)))
INSTALLED_MAN1S=$(patsubst $(MAN_DIR)/%, $(mandir)/%, $(MAN1S))
INSTALLED_MAN4S=$(patsubst $(MAN_DIR)/%, $(mandir)/%, $(MAN4S))

.PHONY: all $(SRC_DIR) install uninstall clean distclean

all: config.mk $(SRC_DIR)
	@:

config.mk:
	@echo "run ./configure first"
	@false

$(SRC_DIR):
	@$(MAKE) -C src

install: all
	install -d $(bindir) $(mandir)/man1 $(mandir)/man4
	[ -z "$(BINS)" ] || install -m 0755 $(BINS) $(bindir)
	[ -z "$(MAN1S)" ] || install -m 0644 $(MAN1S) $(mandir)/man1
	[ -z "$(MAN4S)" ] || install -m 0644 $(MAN4S) $(mandir)/man4

uninstall:
	-rm $(INSTALLED_BINS)
	-rm $(INSTALLED_MAN1S)
	-rm $(INSTALLED_MAN4S)

clean:
	@-$(MAKE) -C src clean

distclean: clean
	-rm config.mk
