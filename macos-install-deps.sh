#!/bin/sh

# Check to see if Homebrew is installed and install if missing.
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH (Apple Silicon or Intel)
  if [ -d /opt/homebrew/bin ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -d /usr/local/bin ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "Updating Homebrew..."
  brew update
fi

# Install packages with Homebrew
brew tap homebrew/autoupdate
brew tap tj/mmake https://github.com/tj/mmake.git
brew install pinentry-mac stow shellcheck fish lazygit neovim luarocks volta \
  jesseduffield/lazynpm/lazynpm uv awscli bat bottom broot dust lsd fd \
  git-delta kdash-rs/kdash/kdash monolith procs ripgrep ripsecrets \
  rm-improved sd starship tealdeer tokei topgrade zellij zoxide fzf tj/mmake/mmake
brew install --cask \
  font-fira-code-nerd-font font-meslo-lg-nerd-font \
  jetbrains-toolbox docker orbstack alacritty

# Cleanup old packages and enable autoupdate for Homebrew
brew cleanup
brew autoupdate stop >/dev/null 2>&1 || true
brew autoupdate start --upgrade --cleanup --immediate

echo "✅ Install complete! Run 'brew doctor' to verify your setup."
