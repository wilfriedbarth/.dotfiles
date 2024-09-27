#!/bin/sh

# Symlink config folders
STOW_FOLDERS="alacritty,fish,git,nvim,starship,zellij,karabiner"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
  echo "Removing $folder"
  stow -D $folder
done
