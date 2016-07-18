# ~/.bash_profile is sourced by bash if it is:
#
# - an interactive shell, and
# - a login shell
#
# after that file is sourced, bash will also read ~/.bash_login
# and ~/.profile, if present
#
# However, it will not read ~/.bashrc, on its own. This behavior
# differs from e.g. ksh/zsh, where the profile and the rc files
# are read by interactive login shells

. ~/.bashrc

[ -f ~/.bash_profile.local ] && . ~/.bash_profile.local
