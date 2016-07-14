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
bindkey '^R' history-incremental-search-backward
# history-incremental-pattern-search-backward

# vi-style key bindings
bindkey -v

# Command completion
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

autoload -U colors && colors

# substitute variables in the prompt string at prompt display time
setopt prompt_subst

PROMPT='%{$fg[green]%}%n@%m %T %D Exit[%?]
%{$fg[red]%}%~ $ %{$reset_color%}'

# also allow # comments on the command line
# (same as `set -k` or `setopt interactivecomments`)
setopt INTERACTIVE_COMMENTS

. ~/.shrc
[ -f ~/.zshrc.local ] && . ~/.zshrc.local
