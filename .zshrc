export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
eval "$(starship init zsh)"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh

alias code="code-insiders"
alias vim="nvim"

clear

# bun completions
[ -s "/Users/addis/.bun/_bun" ] && source "/Users/addis/.bun/_bun"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/Applications/Alacritty.app/Contents/MacOS:$PATH"
export TERMINAL=alacritty

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
