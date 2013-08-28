# fanotify_watch

This tool allows you watch filesystem events using Linux fanotify(7) API.
It has a Mac brother http://github.com/proger/fsevent_watch.

This is a fork of Canonical's tool fatrace: https://launchpad.net/fatrace

The tool differs from the original in the following ways:

* removed power-usage-report
* flags `-s` and `-o` are removed as redundant
* the tool does not read process names on every event by default (see `-n` option)
* output buffer is flushed after processing each event buffer 
* `FAN_ACCESS`-like events are ignored (see caveats)

## Awesomeness

* the output is cute and parseable
* as usual, the tool is composable enough to be used to even develop itself

```

% sudo ./fanotify_watch -c | egrep --line-buffered "$PWD.*\.[ch]$" | tee /dev/stderr | xargs -t -n1 -I% make
6445    CW  /tank/proger/fanotify_watch/fanotify_watch.c
make
cc -O2 -g -Wall -Wextra -Werror   -c -o fanotify_watch.o fanotify_watch.c
cc  -o fanotify_watch fanotify_watch.o
```

## Caveats

* fanotify(7) does not support tracking file deletion/renames
* `fanotify_watch` primarily tracks `FAN_CLOSE_WRITE` (writable file closed) that signals for very probable file write event
    * note that some tools may write the file under a different name and then rename it, this may go unnoticed
* as of Linux 3.10 fanotify(7) needs you to be root (hence `sudo`)
    * you can use suid binaries at your own risk though
* GPL-3, sorry
