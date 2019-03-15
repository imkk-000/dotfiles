# version
NODE_VERSION=10
GO_VERSION=1.12

# enable sudo
sudo whoami >> /dev/null

# update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

# install tools
sudo apt-get install -y git-core
sudo apt-get install -y gcc g++ python make cmake autoconf python-pip
sudo apt-get install -y wget curl xclip traceroute whois ufw tree \
                        net-tools dirmngr apt-transport-https ca-certificates \
                        xinput \
                        zsh tmux vim gnome-tweak-tool dconf-editor \
                        gufw gparted htop p7zip-full software-properties-common \
                        unzip zip nmap transmission vlc gimp
sudo apt-get install -y $(check-language-support)
# install vscode
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
      | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt-get update
sudo apt-get install -y code

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
      | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER

# install google chrome
curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" \
      | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable

# install spotify-client
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo "deb [arch=amd64] http://repository.spotify.com stable non-free" \
      | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client

# install virtualbox
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" \
      | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update
sudo apt-get install -y virtualbox

# install node
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
sudo apt-get install -y nodejs

# install golang
wget -qO- https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz | sudo tar -C /opt/ -xzf -
sudo mv /opt/go /opt/golang

# create directory
mkdir -p $HOME/.icons \
         $HOME/.themes \
         $HOME/.local/share/fonts \
         $HOME/.npm-packages \
         $HOME/.go \
         $HOME/.ssh \
         $HOME/.vim
mkdir -p $HOME/Documents/linux \
         $HOME/Documents/golang \
         $HOME/Documents/node \
         $HOME/Pictures/Profiles

# install papirus-icon
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="$HOME/.icons" sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# copy all config to user directory
cp $PWD/.myconfig/.config/hub $HOME/.config/hub
cp $PWD/.myconfig/.gitconfig $HOME/.gitconfig
cp $PWD/.myconfig/.npmrc $HOME/.npmrc
cp $PWD/.myconfig/.tmux.conf $HOME/.tmux.conf
cp $PWD/.myconfig/.vimrc $HOME/.vimrc
cp $PWD/.myconfig/.zshrc $HOME/.zshrc
