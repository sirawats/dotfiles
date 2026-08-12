#!/usr/bin/env bash
# ==============================================================================
# ZSH Dotfiles Installer
# Installs Oh-My-Zsh, plugins, themes, and links configuration files
# ==============================================================================

set -e

DOTFILES_ZSH="$HOME/dotfiles/zsh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info()  { echo -e "${BLUE}ℹ${NC}  $1"; }
ok()    { echo -e "${GREEN}✅${NC} $1"; }
warn()  { echo -e "${YELLOW}⚠️${NC}  $1"; }
err()   { echo -e "${RED}❌${NC} $1"; }

echo ""
echo "🚀 Setting up ZSH environment..."
echo ""

# ---------- 1. Oh My Zsh ----------
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    ok "Oh My Zsh installed"
else
    ok "Oh My Zsh already installed"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# ---------- 2. Powerlevel10k Theme ----------
if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
    info "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
    ok "Powerlevel10k installed"
else
    ok "Powerlevel10k already installed"
fi

# ---------- 3. ZSH Plugins ----------
declare -A zsh_plugins=(
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
    ["zsh-256color"]="https://github.com/chrissicool/zsh-256color"
)

for plugin_name in "${!zsh_plugins[@]}"; do
    plugin_url="${zsh_plugins[$plugin_name]}"
    plugin_dir="$ZSH_CUSTOM/plugins/$plugin_name"
    if [[ ! -d "$plugin_dir" ]]; then
        info "Installing $plugin_name..."
        git clone "$plugin_url" "$plugin_dir"
        ok "$plugin_name installed"
    else
        ok "$plugin_name already installed"
    fi
done

# ---------- 4. Link Dotfiles ----------
echo ""
info "Linking dotfiles..."

backup_and_link() {
    local src="$1"
    local dest="$2"
    if [[ -f "$dest" ]] && [[ ! -L "$dest" ]]; then
        warn "Backing up existing $dest → ${dest}.bak"
        cp "$dest" "${dest}.bak"
    fi
    ln -sf "$src" "$dest"
    ok "Linked $(basename "$dest")"
}

backup_and_link "$DOTFILES_ZSH/.zshrc" "$HOME/.zshrc"
backup_and_link "$DOTFILES_ZSH/.profile" "$HOME/.profile"

# ---------- 5. Check CLI Tools ----------
echo ""
info "Checking recommended CLI tools..."

check_tool() {
    local tool="$1"
    local install_hint="$2"
    if command -v "$tool" &>/dev/null; then
        ok "$tool"
    else
        warn "$tool not found — $install_hint"
    fi
}

check_tool "fzf"  "brew install fzf / sudo pacman -S fzf"
check_tool "bat"  "brew install bat / sudo pacman -S bat"
check_tool "eza"  "brew install eza / sudo pacman -S eza"
check_tool "mise" "curl https://mise.run | sh"

# ---------- Done ----------
echo ""
echo "✨ Done! Restart your terminal or run: exec zsh"
echo ""
