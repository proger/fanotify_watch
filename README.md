# fatrace

This tool allows you watch filesystem events using Linux fanotify(7) API.
It has a Mac brother http://github.com/proger/fsevent_watch.

This is a fork of Canonical's tool fatrace: https://launchpad.net/fatrace

The tool differs from the original in the following ways:

* removed power-usage-report
* flags `-s` and `-o` are removed as redundant
* the tool does not read process names on every event by default (see `-n` option)
* output buffer is flushed after processing each event buffer 
* TODO: make this tool suid and be runnable by users to watch their own dirs

## Awesomeness

* the output is cute and parseable
* as usual, the tool is composable enough to be used to even develop itself

```
% sudo ./fatrace -c | egrep --line-buffered "W $PWD.*\.[ch]$" | tee /dev/stderr | xargs -t -n1 -I% make
10196: W /tank/proger/fatrace-0.5/fatrace.c
10196: W /tank/proger/fatrace-0.5/fatrace.c
make
cc -O2 -g -Wall -Wextra -Werror   -c -o fatrace.o fatrace.c
```

## Caveats

* as of Linux 3.10 fanotify(7) needs you to be root (hence `sudo`)
* GPL-3, sorry
