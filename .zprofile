# Update terminal geometry when connecting over a serial line
# cf. https://unix.stackexchange.com/a/428764/1131
# https://invisible-island.net/xterm/manpage/resize.html
if [ "$TERM" = vt220 -o "$TERM" = vt110 ]; then
  resize > /dev/null 2>&1
fi
