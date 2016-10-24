# ~/.bash_profile is sourced by bash if it is:
#
# - an interactive shell, and
# - a login shell
#
# Bash will read one of [ ~/.bash_profile, ~/.bash_login , ~/.profile ],
# whatever comes first.
#
# That means if this file is present then bash won't automatically
# try to source ~/.bash_login nor ~/.profile, as well.
#
# Also, it will not read ~/.bashrc, on its own. This behavior
# differs from e.g. ksh/zsh, where the profile and the rc files
# are read by interactive login shells

. ~/.profile

[ -f ~/.bash_profile.local ] && . ~/.bash_profile.local

. ~/.bashrc

true
