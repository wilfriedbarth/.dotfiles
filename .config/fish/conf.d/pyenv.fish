set --export PYENV_ROOT /home/wilfriedbarth/.pyenv

# Enable virtualenv autocomplete
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

