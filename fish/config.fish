set fish_greeting

alias cofe="./node_modules/.bin/coffee -c -o lib src"
alias cat="bat"
alias ls="exa"

set -x LSCOLORS ExGxBxDxCxEgEdxbxgxcxd
set -x EDITOR vim
set -x CLICOLOR 1
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

source $HOME/.config/user.fish
source $HOME/.config/fish/bundle/fishnet/init.fish
