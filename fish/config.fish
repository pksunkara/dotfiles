set fish_greeting

alias cat="bat"
alias ls="eza"
alias la="ls -lah --git"
alias lg="ls -lah --git-repos"
alias vim="nvim"
alias jq="jaq"

set -x EDITOR nvim
set -x CLICOLOR 1
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

source $HOME/.config/user.fish
source $HOME/.config/fish/bundle/fishnet/init.fish
