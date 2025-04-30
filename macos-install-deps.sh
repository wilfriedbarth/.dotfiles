#!/bin/sh

# Check to see if Homebrew is installed and install if missing.

if [ "$(command -v brew)" = "" ]; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Updating Homebrew"
  brew update
fi

# Install packages with Homebrew

## homebrew auto update
brew install pinentry-mac
brew tap homebrew/autoupdate

## JetBrains
brew install --cask jetbrains-toolbox
brew install --cask intellij-idea-ce
brew install --cask pycharm-ce

## Keyboard Shortcuts
brew install --cask karabiner-elements

## Symlinking
brew install stow

## Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-meslo-lg-nerd-font

## Shell
brew install shellcheck
brew install fish

## Git
brew install lazygit

## Lua
brew install luarocks

## Docker
brew install --cask docker
brew install --cask orbstack
brew install jesseduffield/lazydocker/lazydocker

## Neovim
brew install neovim

## Node.js
brew install volta

## Install lazynpm
brew install jesseduffield/lazynpm/lazynpm

## Python
brew install pyenv
brew install --cask anaconda

## Golang
brew tap tj/mmake https://github.com/tj/mmake.git
brew install tj/mmake/mmake

## Rust (treasure chest of replacements - terminal, cli, prompt, and more)
##
## https://github.com/sts10/rust-command-line-utilities
## https://deepu.tech/rust-terminal-tools-linux-mac-windows-fish-zsh/
## https://itsfoss.com/rust-cli-tools/
brew install --cask --no-quarantine alacritty
brew install bat
brew install bottom
brew install broot
brew install dust
brew install lsd
brew install fd
brew install git-delta
brew install kdash-rs/kdash/kdash
brew install monolith
brew install procs
brew install ripgrep
brew install ripsecrets
brew install rm-improved
brew install sd
brew install starship
brew install tealdeer
brew install tokei
brew install topgrade
brew install zellij
brew install zoxide
brew install fzf

## LaTeX
brew install --cask mactex
brew install --cask texstudio

# opencommit
npm install -g opencommit
