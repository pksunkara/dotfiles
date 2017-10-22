# gitalpaca() {
#   git init
#   git remote add origin git@github.com:${1:-alpaca-api}/$(basename $(dirname $(pwd)))-$(basename $(pwd))
#   git fetch origin master
#   git reset origin/master
# }

function gitalpaca
end
