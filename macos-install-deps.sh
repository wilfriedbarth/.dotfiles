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

brew install stow
brew install shellcheck
brew install --cask --no-quarantine alacritty
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install fish
brew install starship
brew install zellij
brew install neovim
brew install fnm
brew install pyenv
