# ~/.bashrc is sourced if:
# - the shell is interactive
# - is this NOT a login shell (if it is then ~/.bash_profile, etc. is read)
#
# It is common to source ~/.bashrc from ~/.bash_profile, though.

# Ususally, this file should only be sourced if the shell is running
# interactively, with that we double check it ...
[ -z "$PS1" ] && return

#################################################################
# Options                                                       #
#################################################################

# fixes some readline related prompt issues in combination with
# some terminals where the LINES/COLUMNS variables are not
# correctly updated
# cf. http://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly/167911#167911
shopt -s checkwinsize

#################################################################
# History                                                       #
#################################################################


shopt -s histappend
HISTFILE=~/.cache/bash_history
HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000

# emulate zsh history sharing feature
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


#################################################################
# Prompt                                                        #
#################################################################

# there are two main sources for broken multi line editing support:
# - escapes in the prompt are not properly enclosed in \[ \]
# - terminal geometry isn't properly updated, cf. checkwinsize shopt

color_off='\[\e[0m\]'
green='\[\e[0;32m\]'
blue='\[\e[0;34m\]'
red='\[\e[0;31m\]'
bred='\[\e[1;31m\]'
bgreen='\[\e[1;32m\]'
bblue='\[\e[1;34m\]'

PS1="\u@$bgreen\h$color_off \$ps1[$red\$?$color_off]\n$bblue\w$color_off $ "


#################################################################
# Bash specific aliases                                         #
#################################################################

# re-execute last command - defined by zsh, by default
alias r='fc -s'

. ~/.shrc

[ -f ~/.bashrc.local ] && . ~/.bashrc.local


