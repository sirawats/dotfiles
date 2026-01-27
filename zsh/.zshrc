if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  cp
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
unsetopt share_history
unsetopt no_match

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Profile (credentials, alias, etc.)
source ~/.profile

# ==== PATH ====
# Mise (version manager)
eval "$(~/.local/bin/mise activate zsh)"
# Cargo (rust)
. "$HOME/.cargo/env"

# bun
[ -s "/Users/sirawats/.bun/_bun" ] && source "/Users/sirawats/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/sirawats/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Added by Antigravity
export PATH="/Users/sirawats/.antigravity/antigravity/bin:$PATH"
