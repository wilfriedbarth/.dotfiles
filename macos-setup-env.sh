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

# Change to dotfiles directory
DOTFILES_DIR="${HOME}/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
  log_error "Directory $DOTFILES_DIR not found"
  log_info "Please clone your dotfiles repository to $DOTFILES_DIR"
  exit 1
fi

cd "$DOTFILES_DIR" || exit 1

# Verify stow is installed
if ! command -v stow >/dev/null 2>&1; then
  log_error "GNU stow is not installed"
  log_info "Run ./macos-install-deps.sh first to install dependencies"
  exit 1
fi

# Stow configuration folders
STOW_FOLDERS="fish git nvim starship wezterm zellij"

log_info "Setting up dotfiles with GNU stow..."
for folder in $STOW_FOLDERS; do
  if [ -d "$folder" ]; then
    log_info "Processing $folder..."
    stow -D "$folder" 2>/dev/null || true
    if stow "$folder" 2>&1; then
      log_success "Linked $folder"
    else
      log_warning "Failed to link $folder (may already exist)"
    fi
  else
    log_warning "Directory $folder not found, skipping..."
  fi
done

# Setup volta for Node.js version management
if command -v volta >/dev/null 2>&1; then
  log_info "Configuring Volta..."
  volta setup
  log_success "Volta configured"
else
  log_warning "Volta not found, skipping setup"
fi

# Configure Fish as default shell if not already set
if command -v fish >/dev/null 2>&1; then
  FISH_PATH=$(command -v fish)
  CURRENT_SHELL=$(dscl . -read ~/ UserShell | sed 's/UserShell: //')
  
  if [ "$CURRENT_SHELL" != "$FISH_PATH" ]; then
    log_info "Setting Fish as default shell..."
    if ! grep -q "$FISH_PATH" /etc/shells; then
      log_info "Adding Fish to /etc/shells (requires sudo)..."
      echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
    fi
    chsh -s "$FISH_PATH"
    log_success "Fish set as default shell (restart terminal to apply)"
  else
    log_success "Fish is already the default shell"
  fi
fi

echo ""
log_success "Setup complete!"
log_info "Restart your terminal or run 'exec fish' to apply changes"
