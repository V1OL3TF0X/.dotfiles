PATH="/opt/homebrew/bin:$PATH"
# oh-my-zsh setup
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
FNM_PATH="$HOME/Library/Application Support/fnm"
eval "$(fnm env --use-on-cd --shell zsh)"
#cargo
export PATH="$HOME/.cargo/bin:$PATH"
# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# starship setup
eval "$(starship init zsh)"
# Set up fzf key bindings and fuzzy completion, as well as zoxide
source <(fzf --zsh)
eval "$(zoxide init zsh --cmd cd)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
