HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
unsetopt PROMPT_SP

# source ~/.profile
export ZSH=$HOME/.zsh
export PATH=$HOME/bin:$PATH
export KEYTIMEOUT=50;
export TERM=xterm-256color

# Customize completion behavior
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

autoload -Uz compinit; compinit
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

zmodload zsh/complist
setopt extendedglob
_comp_options+=(globdots)

[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh

bindkey -v
bindkey "^[[Z" autosuggest-execute
bindkey "\C-j" autosuggest-execute
bindkey "\C-k" up-line-or-search
bindkey "\C-l" autosuggest-accept
<<<<<<< HEAD
# bindkey -M viins 'kj' vi-cmd-mode
=======
bindkey -M viins 'kj' vi-cmd-mode

export PATH=$PATH:/home/jack/.spicetify

ff
