PATH="/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="onedark"
COMPLETION_WAITING_DOTS="true"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
# fnm
FNM_PATH="~/Library/Application Support/fnm"
eval "$(fnm env --use-on-cd --shell zsh)"
. "~/.cargo/env"
# pnpm
export PNPM_HOME="~/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
eval "$(starship init zsh)"
