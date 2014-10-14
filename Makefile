# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# The package path prefix, if you want to install to another root, set DESTDIR to that root.
PREFIX ?= /usr
# The command path excluding prefix.
BIN ?= /bin
# The library header path excluding prefix.
DATA ?= /share
# The command path including prefix.
BINDIR ?= $(PREFIX)$(BIN)
# The resource path including prefix.
DATADIR ?= $(PREFIX)$(DATA)
# The license base path including prefix.
LICENSEDIR ?= $(DATADIR)/licenses

# The name of the package as it should be installed.
PKGNAME ?= rms-pics
# The name of the command as it should be installed.
COMMAND ?= fetch-rms-pics



.PHONY: all
all:


.PHONY: install
install: install-base

.PHONY: install-base
install-base: install-command install-copyright

.PHONY: install-command
install-command:
	install -dm755 -- "$(DESTDIR)$(BINDIR)"
	install -m755 fetch-rms-pics -- "$(DESTDIR)$(BINDIR)/$(COMMAND)"

.PHONY: install-copyright
install-copyright: install-copying

.PHONY: install-copying
install-copying:
	install -dm755 -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"
	install -m644 COPYING -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)/COPYING"

.PHONY: uninstall
uninstall:
	-rm -- "$(DESTDIR)$(BINDIR)/$(COMMAND)"
	-rm -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)/COPYING"
	-rmdir -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"

.PHONY: clean
clean:

