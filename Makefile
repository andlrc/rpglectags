.PHONY:	all uninstall install
all:	rpglectags.1 README

README: rpglectags
	pod2text -q "\`'" $< > $@

rpglectags.1: rpglectags
	pod2man $< \
		-d "$$(date +'%B %Y')" \
		-n $< \
		-c 'ILE RPG Ctags' \
		-r "$(shell ./rpglectags --version)" \
		-q "\`'" > $@

install:	rpglectags rpglectags.1
	cp rpglectags /usr/bin/rpglectags
	cp rpglectags.1 /usr/share/man/man1/rpglectags.1

uninstall:
	rm /usr/bin/rpglectags
	rm /usr/share/man/man1/rpglectags.1

