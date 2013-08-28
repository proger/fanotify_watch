PROG= fanotify_watch

CFLAGS ?= -O2 -g -Wall -Wextra -Werror
PREFIX ?= /usr/local

$(PROG): $(PROG).o
	$(CC) $(LDFLAGS) -o $@ $<

clean:
	rm -f *.o $(PROG)

install: $(PROG)
	install -m 755 -D $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)

.PHONY: clean install
