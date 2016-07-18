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

# cf. http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg[green]%})%n%{$fg_no_bold[green]%}@%{$fg_bold[green]%}%m%{$fg_no_bold[green]%} %T %D Exit[%(?.%?.%{$fg_bold[red]%} %? :-( )%{$fg_no_bold[green]%}]
%{$fg_bold[blue]%}%~ %{$fg_no_bold[green]%}%(!.#.$) %{$reset_color%}'

# also allow # comments on the command line
# (same as `set -k` or `setopt interactivecomments`)
setopt INTERACTIVE_COMMENTS

. ~/.shrc
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

true
