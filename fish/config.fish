set fish_greeting

alias cofe="./node_modules/.bin/coffee -c -o lib src"

set -x LSCOLORS ExGxBxDxCxEgEdxbxgxcxd
set -x EDITOR vim
set -x CLICOLOR 1
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x XML_CATALOG_FILES /usr/local/lib/brew/etc/xml/catalog
set -x HOMEBREW_CASK_OPTS --appdir=/Applications

set -x PATH /usr/local/lib/brew/bin $PATH

source $HOME/.config/fish/user.fish
source $HOME/.config/fish/bundle/fishnet/init.fish
