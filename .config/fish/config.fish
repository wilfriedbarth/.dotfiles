# disable fish greeting
set fish_greeting

# set fish colors
set -Ux fish_color_command '#A8CE93'
set -Ux fish_color_error '#F2C38F';
set -Ux fish_color_param '#C5DFDD';
set -Ux fish_color_autosuggestion '#899BA6';

# set editor to neovim
set -gx EDITOR nvim
set -gx USE_EDITOR nvim
set -gx VISUAL nvim 
set -gx GIT_EDITOR nvim

# fzf
set -gx FZF_LEGACY_KEYBINDINGS 0
set -gx FZF_TMUX 1
set -gx FZF_DEFAULT_COMMAND 'rg --follow --smart-case --no-heading --line-number --files'
set -gx FZF_CTRL_T_COMMAND FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--color fg:#C5D4DD,fg+:#C5D4DD,bg:#3C4C55,bg+:#556873,hl:#7FC1CA,hl+:#7FC1CA,prompt:#7FC1CA,pointer:#7FC1CA,marker:#7FC1CA,info:#7FC1CA,border:#899BA6,spinner:#7FC1CA,header:#1E272C'

# aliases
alias vim nvim

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
