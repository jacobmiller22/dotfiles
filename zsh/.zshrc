export EDITOR="nvim"


##
# Default PATH
##
# export PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

##
# Set XDG
##
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# export PATH="$PATH:/usr/local/bin:/usr/bin"
export PATH="$PATH:$HOME/.local/scripts"

##
# ZInit
##
autoload -Uz compinit && compinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

zinit light ohmyzsh/ohmyzsh
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
setopt auto_cd

export GOPATH=$HOME/.local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOBIN

# History - Separate history files for each session
ZSH_HISTORY=$(tmux-session-history)


# Node Version Manager
export NVM_DIR=~/.nvm
if [[ $(uname) == "Darwin" ]]; then 
	source $(brew --prefix nvm)/nvm.sh 
else 
	source $NVM_DIR/nvm.sh 
fi

##
# Starship: Prompt customizations
##
eval "$(starship init zsh)"


##
# Aliases
##
alias tms=tmux-sessionizer
function kpp(){
    kill $(lsof -t -i:$1)
}

# bun completions
[ -s "/Users/jacobmiller22/.bun/_bun" ] && source "/Users/jacobmiller22/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

