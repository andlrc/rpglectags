prgname=rpglectags
title=RPG/ILE Ctags

cmddir=/usr/bin
mandir=/usr/share/man/man1
version=$(shell ./$(prgname) --version)

install: install-man install-cmd

clean: clean-man clean-cmd

install-cmd:
	cp $(prgname) $(cmddir)/$(prgname)

clean-cmd:
	rm $(cmddir)/$(prgname)

install-man:
	cp $(prgname).1 $(mandir)/$(prgname).1

clean-man:
	rm $(mandir)/$(prgname).1

pod: README $(prgname).1

README: $(prgname)
	pod2text -q "\`'" $(prgname) > README

$(prgname).1: $(prgname)
	pod2man $(prgname) \
		-d "$$(date +'%B %Y')" \
		-n $(prgname) \
		-c '$(title)' \
		-r "$(version)" \
		-q "\`'" > $(prgname).1
