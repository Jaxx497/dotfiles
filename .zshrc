HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep

source ~/.profile
export ZSH=$HOME/.zsh
export PATH=$HOME/bin:$PATH
export KEYTIMEOUT=50;
export TERM=xterm-256color

# Customize completion behavior
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer, _complete _appproximate
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

autoload -Uz compinit; compinit
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

zmodload zsh/complist
setopt extendedglob
_comp_options+=(globdots)

[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh

bindkey -v
bindkey "^[[Z" autosuggest-accept
#bindkey "^[[Z" autosuggest-accept
bindkey -M viins 'kj' vi-cmd-mode
