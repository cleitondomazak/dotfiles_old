# asks for sudo password and keeps its session alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo apt-get update

# common stuff
sudo apt-get install -fy
sudo apt-get upgrade -y
sudo apt-get install -y ubuntu-restricted-extras zsh terminator curl xsel \
  gnome-tweak-tool vim-nox smbclient htop openssh-server s3cmd openvpn \
  network-manager-openvpn git python-pip

# chrome
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --force-depends -i chrome.deb
rm chrome.deb
sudo apt-get install -fy

# programming fonts
#curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

# vscode
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make
umake web visual-studio-code

# dropbox
wget -O dropbox.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.2_amd64.deb"
sudo dpkg --force-depends -i dropbox.deb
rm dropbox.deb
sudo apt-get install -fy

# postgres
#sudo apt-get update
#sudo apt-get install -y postgresql postgresql-contrib pgadmin3 pg-activity
#echo -e "local   all             all                                     trust
#host    all             all             127.0.0.1/32            trust
#host    all             all             127.17.0.0/16           trust
#host    all             all             10.0.0.0/8              trust" | sudo tee /etc/postgresql/9.*/main/pg_hba.conf
#echo "listen_addresses = ''" | sudo tee -a /etc/postgresql/9./main/postgresql.conf
#sudo service postgresql restart

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client

# slack
wget -O slack.deb "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.1.0-amd64.deb"
sudo dpkg --force-depends -i slack.deb
rm slack.deb

# optimize swap usage
echo "vm.swappiness = 1" | sudo tee -a /etc/sysctl.conf

# optimize max view files
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf

# dotfiles
sudo apt-get install -y ruby
git clone https://github.com/cleitondomazak/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
chsh -s /bin/zsh
mkdir -p ~/Code

# clean up
sudo apt-get autoclean
sudo apt-get autoremove -y
sudo reboot
