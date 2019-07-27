# load zsh config
export ZSH='/home/kk/.oh-my-zsh'
ZSH_THEME='robbyrussell'
CASE_SENSITIVE='true'
plugins=(
    git
    catimg
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# set user environment
export TERM=xterm-256color
export GOPATH=$HOME/.go
export PATH=/opt/go/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
