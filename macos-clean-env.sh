#!/bin/sh

# Symlink config folder
STOW_FOLDERS="wezterm zellij fish startship nvim git"

for folder in $STOW_FOLDERS; do
  echo "Removing $folder..."
  stow -D "$folder" 2>/dev/null || true
done

echo "✅ Clean complete!"
