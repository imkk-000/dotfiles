# enable sudo
sudo whoami >> /dev/null
# end enable sudo

# update and upgrade
sudo apt update && sudo apt upgrade -y
# end update and upgrade

# install tools
sudo apt install -y git-core
sudo apt install -y wget curl xclip traceroute whois ufw tree \
                    net-tools dirmngr apt-transport-https ca-certificates \
                    xinput

sudo apt install -y zsh tmux vim gnome-tweak-tool dconf-editor \
                    gufw gparted htop p7zip-full software-properties-common \
                    unzip zip nmap
# end install tools

# install vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
                    | sudo tee /etc/apt/sources.list.d/vscode.list
# end install vscode

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
                    | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
# end install docker
