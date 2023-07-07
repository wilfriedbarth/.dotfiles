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

## Symlinking
brew install stow

## Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-meslo-lg-nerd-font

## Shell
brew install shellcheck
brew install fish

## Docker
brew install --cask docker

## Neovim
brew install neovim

## Node.js
brew install fnm
brew install pnpm

## Python
brew install pyenv

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
brew install exa
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
