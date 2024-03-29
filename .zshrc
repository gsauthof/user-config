# is executed by interactive login and normal zsh shells

# History configuration
HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't include commands into the history that start with a blank
setopt HIST_IGNORE_SPACE

# vi-style key bindings
bindkey -v
# the one useful emacs-style key binding:
bindkey '^R' history-incremental-search-backward
# variation - enables globbing/regex with incremental search:
# bindkey '^R' history-incremental-pattern-search-backward

# invoke external external when pressing v in "command-mode"
# like in ksh/bash
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Command completion
fpath=(~/.config/zsh/function $fpath)
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

autoload -U colors && colors

# substitute variables in the prompt string at prompt display time
setopt prompt_subst

# cf. http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg[green]%})%n%{$fg_no_bold[green]%}@%{$fg_bold[green]%}%m%{$fg_no_bold[green]%} %T %D Exit[%(?.%?.%{$fg_bold[red]%} %? :-( )%{$fg_no_bold[green]%}]
%{$fg_bold[blue]%}%~ %{$fg_no_bold[green]%}%(!.#.$) %{$reset_color%}'

# autopush, i.e. each cd acts like a `pushd`
# e.g. cd -1 => go to the 2nd last directory on the stack
# or echo =1 prints that directory
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

#################################################################
# Other Options                                                 #
#################################################################

# usually disabled by default, but some systems have it enabled
setopt noignoreeof

# also allow # comments on the command line
# (same as `set -k` or `setopt interactivecomments`)
setopt INTERACTIVE_COMMENTS

alias icat='kitty +kitten icat'


. ~/.shrc
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

true
