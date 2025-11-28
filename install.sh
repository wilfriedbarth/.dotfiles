#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

log_header() {
  echo -e "\n${CYAN}═══════════════════════════════════════════${NC}"
  echo -e "${CYAN}  $*${NC}"
  echo -e "${CYAN}═══════════════════════════════════════════${NC}\n"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
  log_error "This script is designed for macOS only"
  exit 1
fi

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_header "Dotfiles Installation"
echo -e "This script will:"
echo -e "  1. Install Homebrew and dependencies"
echo -e "  2. Set up configuration symlinks"
echo -e "  3. Configure your development environment"
echo ""

read -p "Continue? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  log_warning "Installation cancelled"
  exit 0
fi

# Step 1: Install dependencies
log_header "Step 1/3: Installing Dependencies"
if [ -x "$DOTFILES_DIR/macos-install-deps.sh" ]; then
  "$DOTFILES_DIR/macos-install-deps.sh"
else
  log_error "Could not find or execute macos-install-deps.sh"
  exit 1
fi

# Step 2: Set up symlinks
log_header "Step 2/3: Setting Up Configuration"
if [ -x "$DOTFILES_DIR/macos-setup-env.sh" ]; then
  "$DOTFILES_DIR/macos-setup-env.sh"
else
  log_error "Could not find or execute macos-setup-env.sh"
  exit 1
fi

# Step 3: Post-installation notes
log_header "Step 3/3: Post-Installation"

echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo -e "${CYAN}Next steps:${NC}"
echo -e "  1. Restart your terminal or run: ${YELLOW}exec fish${NC}"
echo -e "  2. Review your configuration files in ~/.config/"
echo -e "  3. Run ${YELLOW}brew doctor${NC} to verify Homebrew setup"
echo -e "  4. Run ${YELLOW}topgrade${NC} to update all packages"
echo ""
echo -e "${CYAN}Available commands:${NC}"
echo -e "  • ${YELLOW}./macos-install-deps.sh${NC} - Install/update dependencies"
echo -e "  • ${YELLOW}./macos-setup-env.sh${NC}   - Re-link configuration files"
echo -e "  • ${YELLOW}./macos-clean-env.sh${NC}   - Remove configuration symlinks"
echo ""

