#!/bin/sh

# Symlink config folders from .dotfiles
cd "$HOME/.dotfiles" || {
  echo "Missing ~/.dotfiles"
  exit 1
}

STOW_FOLDERS="alacritty fish git nvim starship zellij karabiner idea"

for folder in $STOW_FOLDERS; do
  echo "Restowing $folder..."
  stow -D "$folder" 2>/dev/null || true
  stow "$folder"
done

# Setup volta
if command -v volta >/dev/null 2>&1; then
  echo "Configuring Volta..."
  volta setup
fi

echo "✅ Setup complete!"
