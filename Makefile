.PHONY:	all uninstall install
all:	rpglectags.1 README

README: rpglectags.1
	LC_ALL=C MANWIDTH=80 man -l $< > $@

install:	rpglectags rpglectags.1
	cp rpglectags /usr/bin/rpglectags
	cp rpglectags.1 /usr/share/man/man1/rpglectags.1

uninstall:
	rm /usr/bin/rpglectags
	rm /usr/share/man/man1/rpglectags.1

