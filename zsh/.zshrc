# ==============================================================================
# ZSH Configuration — github.com/sirawats/dotfiles
# Works standalone (macOS / Linux) or alongside HyDE (Arch Linux)
# ==============================================================================

# Powerlevel10k instant prompt (must stay near the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- Oh-My-Zsh ----
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
# On HyDE, zsh-256color/autosuggestions/syntax-highlighting are also auto-injected
# and deduplicated — listing them here ensures they load on non-HyDE systems too
if [[ "${HYDE_ZSH_NO_PLUGINS}" != "1" ]]; then
    plugins=(
        sudo
        git
        cp
        zsh-autosuggestions
        zsh-syntax-highlighting
        zsh-256color
    )
fi

# Source OMZ + load UX enhancements (skipped on HyDE — it handles this)
if [[ -z "$HYDE_ZSH_DEFER" ]]; then
    export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
    [[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

    # Load functions (bat, eza, fzf aliases)
    for _f in "$HOME/dotfiles/zsh/functions/"*.zsh(N); do
        source "$_f"
    done

    # Load completions (fzf keybindings)
    for _f in "$HOME/dotfiles/zsh/completions/"*.zsh(N); do
        source "$_f"
    done
    unset _f
fi

# ---- General Settings ----
export LANG=en_US.UTF-8
export EDITOR="${EDITOR:-code}"
export GPG_TTY=$(tty)
unsetopt share_history
unsetopt no_match

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Profile (credentials, aliases, etc.)
[[ -f ~/.profile ]] && source ~/.profile

# ---- PATH & Tools ----
# Mise (polyglot version manager)
if [[ -f "$HOME/.local/bin/mise" ]]; then
    eval "$(~/.local/bin/mise activate zsh)"
fi

# Cargo (Rust)
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Bun
if [[ -d "$HOME/.bun" ]]; then
    export BUN_INSTALL="$HOME/.bun"
    [[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# pnpm
if [[ -d "$HOME/Library/pnpm" ]]; then
    export PNPM_HOME="$HOME/Library/pnpm"
elif [[ -d "$HOME/.local/share/pnpm" ]]; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
fi
if [[ -n "$PNPM_HOME" ]]; then
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"
