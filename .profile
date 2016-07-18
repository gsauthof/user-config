# sourced by bash/ksh/zsh
#
# - bash source ~/.profile if and only if neither ~/.bash_profile
#   nor ~/.bash_login are present
# - zsh sources ~/.profile in compatibility mode
# - ksh also sources their rc file after that

[ -f ~/.profile.local ] && . ~/.profile.local
