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
  exit 1
fi

cd "$DOTFILES_DIR" || exit 1

# Verify stow is installed
if ! command -v stow >/dev/null 2>&1; then
  log_error "GNU stow is not installed"
  exit 1
fi

# Remove symlinked configuration folders
STOW_FOLDERS="fish git nvim starship wezterm zellij"

log_info "Removing dotfile symlinks..."
for folder in $STOW_FOLDERS; do
  if [ -d "$folder" ]; then
    log_info "Removing $folder..."
    if stow -D "$folder" 2>/dev/null; then
      log_success "Removed $folder"
    else
      log_warning "Failed to remove $folder (may not be linked)"
    fi
  fi
done

echo ""
log_success "Cleanup complete!"
