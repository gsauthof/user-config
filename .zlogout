# no run control sourcing
# i.e. skip sourcing the systems /etc/zlogout, as it clears the
# screen on some systems - e.g. when one terminates an ssh session
# cf. http://unix.stackexchange.com/questions/70955/preventing-the-screen-from-being-cleared-when-exiting-an-ssh-session/162897#162897
setopt norcs
