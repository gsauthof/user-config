# ~/.kshrc is sourced by interactive ksh shell
# in contrast to bash, login and non-login interactive shells
# source this file
# login ksh shells also source ~/.profile before this file

HISTFILE=~/.cache/bash_history
HISTSIZE=10000

source ~/.shrc

[ -f ~/.kshrc.local ] && source ~/.kshrc.local
