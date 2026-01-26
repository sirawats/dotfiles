# dotfiles

Personal macOS / Linux dotfiles


## Install

```bash
git clone https://github.com/sirawats/dotfiles.git ~/.dotfiles
```

## Preference

### Terminal

- **Emulator:** <img src="https://sw.kovidgoyal.net/kitty/_static/kitty.svg" width="24" height="24" /> [kitty](https://sw.kovidgoyal.net/kitty/)
  ```bash
  # macos/linux
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

  
  ```
  
- **Shell:** [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  ```bash
  brew install zsh # macOS
  chsh -s $(which zsh) # change default shell
  apt install zsh # linux

- **Configuration Framework:** [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
  
- **Zsh Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  ```
### Neovim

- **Pre-setup:** [lazyvim](https://github.com/LazyVim/LazyVim)
  ```bash
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  ```
