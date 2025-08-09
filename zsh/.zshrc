
# XDG
source $HOME/.local/share/zsh/xdg.sh

##
# ZInit
##
autoload -Uz compinit && compinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   # source $XDG_DATA_HOME/zsh/proxy.sh
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
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
export PATH="$PATH:$HOME/.local/scripts"
export PATH="$PATH:$XDG_DATA_HOME/nvim/mason/bin"
export PATH="$PATH:$HOME/.local/bin"

# JS
source $XDG_DATA_HOME/zsh/js.sh

# python
export PATH="$(pyenv root)/shims:$PATH"
eval "$(pyenv init --path)"

##
# Starship: Prompt customizations
##
eval "$(starship init zsh)"


##
# Aliases
##
alias tms=tmux-sessionizer

# Kill process on port
function kpp(){
    kill $(lsof -t -i:$1)
}




eval "$(direnv hook zsh)"

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
