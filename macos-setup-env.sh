#!/bin/sh

# Symlink config folders
STOW_FOLDERS="alacritty,fish,git,nvim,starship,zellij,karabiner,idea"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
  echo "stow $folder"
  stow -D $folder
  stow $folder
done

volta setup

brew autoupdate start --upgrade --cleanup --immediate --sudo
