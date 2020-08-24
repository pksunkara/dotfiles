set -x GOPATH $HOME/.go
set -x GOROOT (brew --prefix go)/libexec

set -x fish_user_paths $GOPATH/bin $fish_user_paths
