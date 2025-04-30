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

# alias cat to bat (https://github.com/sharkdp/bat) and setup theme
alias cat bat
set -Ux BAT_THEME ansi

# alias du to dust (https://github.com/bootandy/dust)
alias du dust

# alias ls to exa (https://the.exa.website/)
alias ls='lsd --git --color=always --group-directories-first'

# alias find to fd (https://github.com/sharkdp/fd)
alias find fd

# alias ps to procs (https://github.com/dalance/procs)
alias ps procs

# alias sed to sd (https://github.com/chmln/sd)
alias sed sd

# init pyenv
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# init zoxide
zoxide init fish | source

# alias cd to z (https://github.com/ajeetdsouza/zoxide)
alias cd z

# alias lzg to lazygit (https://github.com/jesseduffield/lazygit)
alias lzg lazygit

# alias lzd to lazydocker (https://github.com/jesseduffield/lazydocker)
alias lzd lazydocker

# alias lzn to lazynpm (https://github.com/)
alias lzn lazynpm

# init starship
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/anaconda3/bin/conda
    eval /opt/homebrew/anaconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Setting PATH for Python 3.12
# The original version is saved in /Users/wilfriedbarth/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bin" "$PATH"

# Added by Windsurf
fish_add_path /Users/wilfriedbarth/.codeium/windsurf/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
