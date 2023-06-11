
# disable fish greeting
set fish_greeting

# set fish colors
set -Ux fish_color_command '#A8CE93'
set -Ux fish_color_error '#F2C38F';
set -Ux fish_color_param '#C5DFDD';
set -Ux fish_color_autosuggestion '#899BA6';

# add brew binaries to fish path
fish_add_path /opt/homebrew/bin

# set neovim configs
set -gx EDITOR nvim
set -gx USE_EDITOR nvim
set -gx VISUAL nvim 
set -gx GIT_EDITOR nvim
alias vim nvim

# init starship
starship init fish | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
