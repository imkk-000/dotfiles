export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PATH=/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:$PATH
export PATH=$HOME/go/bin:$PATH
