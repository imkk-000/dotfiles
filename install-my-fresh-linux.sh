# this script testing on debian 10 (buster)

# enable sudo
sudo whoami >> /dev/null

# update and upgrade
sudo apt update
sudo apt upgrade -y

# install tools
sudo apt install -y git-core \
                    gcc g++ python python3 openjdk-11-jdk make cmake autoconf python-pip \
                    wget curl xclip traceroute whois ufw tree \
                    net-tools dirmngr apt-transport-https ca-certificates \
                    xinput network-manager-openvpn-gnome \
                    zsh tmux vim gnome-tweak-tool dconf-editor \
                    gufw gparted htop p7zip-full software-properties-common \
                    unzip zip nmap gnome-panel \
                    fonts-thai-tlwg fonts-nanum fonts-roboto fonts-firacode

# install vscode stable
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
      | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code

# install docker-ce and docker-compose
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER

# install google chrome stable
curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" \
      | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

# install slack
curl -fsSL https://packagecloud.io/slacktechnologies/slack/gpgkey | sudo apt-key add -
echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" \
      | sudo tee /etc/apt/sources.list.d/slack.list
sudo apt update
sudo apt install -y slack-desktop

# install spotify-client
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo "deb [arch=amd64] http://repository.spotify.com stable non-free" \
      | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# create directory
mkdir -p $HOME/.local/share/gnome-shell/extensions \
         $HOME/.config \
         $HOME/.npm-packages \
         $HOME/.go \
         $HOME/.ssh \
         $HOME/.vim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
