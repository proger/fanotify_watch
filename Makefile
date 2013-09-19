PROG= fanotify_watch

CFLAGS ?= -O2 -g -Wall -Wextra -Werror
PREFIX ?= /usr

$(PROG): $(PROG).o
	$(CC) $(LDFLAGS) -o $@ $<

clean:
	rm -f *.o $(PROG)

install: $(PROG)
	install -m 755 -D $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)
	chmod +s $(DESTDIR)$(PREFIX)/bin/$(PROG) # BEWARE

.PHONY: clean install
