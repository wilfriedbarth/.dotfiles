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

# setup ruby
set -gx RBENV_ROOT ~/.rbenv
status is-interactive; and . (rbenv init -|psub)

# setup python
source .venv/bin/activate.fish
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# alias make to mmake (https://github.com/tj/mmake)
alias make mmake

# alias cat to bat (https://github.com/sharkdp/bat) and setup theme
alias cat bat
set -Ux BAT_THEME ansi

# alias du to dust (https://github.com/bootandy/dust)
alias du dust

# alias ls to lsd (https://github.com/lsd-rs/lsd)
alias ls='lsd --git --color=always --group-directories-first'

# alias find to fd (https://github.com/sharkdp/fd)
alias find fd

# alias ps to procs (https://github.com/dalance/procs)
alias ps procs

# alias sed to sd (https://github.com/chmln/sd)
alias sed sd

# alias tealdeer to tldr
alias tldr='tldr --color always'

# ---- zoxide (better cd) ----
zoxide init fish | source
alias cd z

# ---- lazy tools ----
alias lzg lazygit
alias lzd lazydocker
alias lzn lazynpm

# ---- starship prompt ----
starship init fish | source

# ---- OrbStack integration ----
if test -f "$HOME/.orbstack/shell/init2.fish"
    source "$HOME/.orbstack/shell/init2.fish"
end

# ---- uv (Python package manager) ----
if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

# ---- Volta (Node.js version manager) ----
if test -d "$HOME/.volta"
    set -gx VOLTA_HOME "$HOME/.volta"
    fish_add_path "$VOLTA_HOME/bin"
end
