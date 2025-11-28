#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
  echo -e "${BLUE}ℹ${NC} $*"
}

log_success() {
  echo -e "${GREEN}✓${NC} $*"
}

log_warning() {
  echo -e "${YELLOW}⚠${NC} $*"
}

log_error() {
  echo -e "${RED}✗${NC} $*"
}

# Check to see if Homebrew is installed and install if missing
if ! command -v brew >/dev/null 2>&1; then
  log_info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew to PATH (Apple Silicon or Intel)
  if [ -d /opt/homebrew/bin ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -d /usr/local/bin ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  log_success "Homebrew installed successfully"
else
  log_info "Updating Homebrew..."
  brew update
  log_success "Homebrew updated"
fi

# Add taps
log_info "Adding Homebrew taps..."
brew tap homebrew/autoupdate
brew tap tj/mmake https://github.com/tj/mmake.git
brew tap sdkman/tap
log_success "Taps added"

# Install CLI tools
log_info "Installing CLI tools..."
brew install \
  awscli \
  bat \
  bottom \
  broot \
  dust \
  fd \
  fish \
  fzf \
  git-delta \
  kdash-rs/kdash/kdash \
  lazygit \
  jesseduffield/lazynpm/lazynpm \
  lsd \
  luarocks \
  monolith \
  neovim \
  pinentry-mac \
  procs \
  rbenv \
  ripgrep \
  ripsecrets \
  rm-improved \
  sd \
  sdkman-cli \
  shellcheck \
  starship \
  stow \
  tealdeer \
  tj/mmake/mmake \
  tokei \
  topgrade \
  uv \
  volta \
  zellij \
  zoxide

log_success "CLI tools installed"

# Install GUI applications
log_info "Installing GUI applications..."
brew install --cask \
  cursor \
  font-fira-code-nerd-font \
  font-meslo-lg-nerd-font \
  jetbrains-toolbox \
  orbstack \
  postman \
  wezterm

log_success "GUI applications and fonts installed"

# Install fonts
log_info "Installing fonts..."
brew install --cask \
  font-fira-code-nerd-font \
  font-meslo-lg-nerd-font

log_success "Fonts installed"

# Update all packages
log_info "Updating all packages..."
topgrade -n
topgrade
log_info "Package updates complete"

echo ""
log_success "Installation complete! Run 'brew doctor' to verify your setup."
