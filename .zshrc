HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep

export ZSH=$HOME/.zsh
export PATH=$HOME/bin:$PATH
export KEYTIMEOUT=50;
export TERM=xterm-256color

autoload -Uz compinit

zstyle :compinstall filename '/home/jack/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

compinit

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

zmodload zsh/complist
setopt extendedglob
_comp_options+=(globdots)

bindkey -v
bindkey "^[[Z" autosuggest-accept
bindkey -M viins 'kj' vi-cmd-mode

# alias cls='clear'
# alias zrc='source ~/.zshrc && clear'
#
# # Python shortcuts
# alias py=python3
# alias python=python3
#
# # Zypper shortcuts
# alias zyp='sudo zypper in'
# alias zypi='sudo zypper in'
# alias zypr='sudo zypper rm'
#
# # Nvim shortcuts
# alias nv='nvim .'
# alias nvl="NVIM_APPNAME=nvimlite nvim"
# alias nvco='cd ~/.config/nvim && nvim .'
# alias nvz='nvim ~/.zshrc'

[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh
