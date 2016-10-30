mandir=/usr/share/man/man1
prgname=rpglectags
cmddir=/usr/bin
title=RPG/ILE Ctags
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

pod:
	pod2text -q "\`'" $(prgname) > README
	pod2man $(prgname) \
		-d "$$(date +'%B %Y')" \
		-n $(prgname) \
		-c '$(title)' \
		-r "$(version)" \
		-q "\`'" > $(prgname).1
