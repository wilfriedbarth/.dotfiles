#!/bin/sh

# Symlink config folders
STOW_FOLDERS="alacritty fish git nvim starship zellij karabiner"

for folder in $STOW_FOLDERS; do
  echo "Removing $folder..."
  stow -D "$folder" 2>/dev/null || true
done

echo "✅ Clean complete!"
