# load zsh config
export ZSH='/home/kk/.oh-my-zsh'
ZSH_THEME='robbyrussell'
CASE_SENSITIVE='true'
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
. $ZSH/oh-my-zsh.sh

# set shortcut
alias git='hub'
alias here='basename `pwd`'

# set user environment
export TERM=xterm-256color
export GOPATH=$HOME/.go
export PATH=/opt/golang/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=/opt/node/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export PATH=/opt/postman:$PATH

