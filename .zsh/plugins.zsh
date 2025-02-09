eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd j)"

# BUN CONFIGURATION
export PATH=$PATH:/home/jack/.spicetify
export BUN_INSTALL="$HOME/.bun"
[ -s "/home/jaxx/.bun/_bun" ] && source "/home/jaxx/.bun/_bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# FZF TAB COMPLETION
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
enable-fzf-tab

# ZSH PLUGINS
source ~/.zsh/autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
