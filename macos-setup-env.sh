#!/bin/sh

# Symlink config folders
STOW_FOLDERS="alacritty,fish,git,nvim,starship,zellij"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
  echo "stow $folder"
  stow -D $folder
  stow $folder
done

volta setup
