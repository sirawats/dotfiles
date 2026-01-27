# dotfiles

Personal macOS / Linux dotfiles


## Install

```bash
git clone https://github.com/sirawats/dotfiles.git ~/.dotfiles
```

## Installation

### Terminal

- **Emulator:** <img src="https://sw.kovidgoyal.net/kitty/_static/kitty.svg" width="24" height="24" /> [kitty](https://sw.kovidgoyal.net/kitty/)
  ```bash
  # macos/linux
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ```
  - **Configuration:**
    ```bash
    cd ~/.config/kitty
    
    # Settings
    curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/kitty/kitty.conf -o kitty.conf

    # Color Scheme
    https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/kitty/moondrop.conf
    ```
  
- **Shell:** [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  ```bash
  brew install zsh # macOS
  chsh -s $(which zsh) # change default shell
  apt install zsh # linux
  ```

  - **Configuration Framework:** [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    
  - **Zsh Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    ```
  - **Configuration:**
    ```bash
    curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/zsh/.zshrc -o ~/.zshrc
    curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/zsh/.profile -o ~/.profile
    ```

### Neovim

- **Nvim:** [Release](https://github.com/neovim/neovim/releases) *(Check LazyVim's supported versions first)*

- **Pre-setup:** [lazyvim](https://github.com/LazyVim/LazyVim)
  ```bash
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  ```
  - **Configuration:**
    ```bash
    # Configuration
    curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/neovim/config/keymaps.lua -o ~/.config/nvim/config/keymaps.lua
    curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/neovim/config/options.lua -o ~/.config/nvim/config/options.lua
    
    # Plugins
    curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/neovim/lua/plugins.lua -o ~/.config/nvim/lua/plugins.lua
    ```

### tmux
- **tmux:** [Release](https://github.com/tmux/tmux/releases)
  ```bash
  brew install tmux # macOS
  apt install tmux # linux
  ```
  - **Configuration:**
    ```bash
    curl -fsSL "https://github.com/sirawats/.tmux/raw/refs/heads/master/install.sh#$(date +%s)" | bash
    ```

### macOS
- **Tiling Window Manager:** [yabai](https://github.com/asmvik/yabai)
  ```bash
  brew install asmvik/formulae/yabai
  
  # Install settings
  curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/macos/.yabairc -o ~/.yabairc

  # Start
  yabai --start-service
  ```

- **Hotkey Daemon:** [skhd](https://github.com/asmvik/skhd)
  ```bash
  brew install asmvik/formulae/skhd
  
  # Install settings
  curl -L https://raw.githubusercontent.com/sirawats/dotfiles/refs/heads/master/macos/.skhdrc -o ~/.skhdrc

  # Start
  skhd --start-service
  ```