
# disable fish greeting
set fish_greeting

# set fish colors
set -Ux fish_color_command '#A8CE93'
set -Ux fish_color_error '#F2C38F'
set -Ux fish_color_param '#C5DFDD'
set -Ux fish_color_autosuggestion '#899BA6'

# add brew binaries to fish path
fish_add_path /opt/homebrew/bin

# set neovim configs
set -gx EDITOR nvim
set -gx USE_EDITOR nvim
set -gx VISUAL nvim
set -gx GIT_EDITOR nvim
alias vim nvim

# set go path
set -gx GOPATH (go env GOPATH)
set -gx PATH $PATH (go env GOPATH)/bin

# alias make to mmake (https://github.com/tj/mmake)
alias make mmake

# init fnm
fnm env --use-on-cd | source

# init pyenv
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# init starship
starship init fish | source
