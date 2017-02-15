PRGNAME=rpglectags
TITLE=RPG/ILE Ctags
VERSION=$(shell ./$(PRGNAME) --version)

DESTDIR=
CMDDIR=$(DESTDIR)/usr/bin
MANDIR=$(DESTDIR)/usr/share/man/man1

install: install-man install-cmd

clean: clean-man clean-cmd

install-cmd:
	cp $(PRGNAME) $(CMDDIR)/$(PRGNAME)

clean-cmd:
	rm $(CMDDIR)/$(PRGNAME)

install-man: $(PRGNAME).1
	cp $(PRGNAME).1 $(MANDIR)/$(PRGNAME).1

clean-man:
	rm $(MANDIR)/$(PRGNAME).1

pod: README $(PRGNAME).1

README: $(PRGNAME)
	pod2text -q "\`'" $(PRGNAME) > README

$(PRGNAME).1: $(PRGNAME)
	pod2man $(PRGNAME) \
		-d "$$(date +'%B %Y')" \
		-n $(PRGNAME) \
		-c '$(TITLE)' \
		-r "$(VERSION)" \
		-q "\`'" > $(PRGNAME).1
