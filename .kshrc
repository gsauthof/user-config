# ~/.kshrc is sourced by interactive ksh shell
# in contrast to bash, login and non-login interactive shells
# source this file
# login ksh shells also source ~/.profile before this file

source ~/.shrc

[ -f ~/.kshrc.local ] && source ~/.kshrc.local
