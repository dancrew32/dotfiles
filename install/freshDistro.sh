#!/bin/bash
# I assume you have git already if you've downloaded this file...
cp .bashrc .vimrc .bash_aliases .inputrc ~/ &&
cp -R .vim ~/.vim &&
cd ~/Desktop &&
# get latest first...
sudo echo "deb http://dl.google.com/linux/deb/ stable non-free main" | tee -a /etc/apt/sources.list &&
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&
sudo apt-get -y update && sudo apt-get -y upgrade &&
# base stuff
sudo apt-get -y install build-essential ubuntu-restricted-extras vim python ruby rubygems ruby1.8-dev msttcorefonts google-chrome-stable exuberant-ctags tasksel && 
sudo gem update && sudo gem install rake &&
#php stuff
sudo tasksel install lamp-server && 
sudo apt-get -y install phpmyadmin &&
sudo a2enmod rewrite &&
#memcached
wget http://www.monkey.org/~provos/libevent-1.4.8-stable.tar.gz &&
tar xfz libevent-1.4.8-stable.tar.gz &&
cd libevent-1.4.8-stable &&
sudo ./configure && sudo make && sudo make install &&
# I guess the following link is automagically made
#sudo ln -s /usr/local/lib/libevent-1.4.so.2 /usr/lib &&
sudo wget http://danga.com/memcached/dist/memcached-1.2.6.tar.gz &&
sudo tar xfz memcached-1.2.6.tar.gz &&
cd memcached-1.2.6 &&
sudo ./configure && sudo make && sudo make install &&
apt-get -y install php5-memcache &&
apt-get -y install php-pear &&
apt-get -y install php5-cli &&
cd ~/Desktop &&
git clone https://github.com/facebook/phpsh.git &&
cd phpsh && sudo python setup.py build && sudo python setup.py install && cd ~/Desktop &&
# update font cache
sudo fc-cache -fv &&
# get more cool stuff
sudo apt-get -y install redshift virtualbox-ose moc filezilla safe-rm git-gui gitk &&
sudo gem install vimgolf &&
# get rid of suck
sudo apt-get -y remove --purge rhythmbox gwibber gwibber-service shotwell banshee pitivi empathy evolution &&
sudo apt-get -y remove evolution-indicator && sudo apt-get -y remove indicator-messages &&
sudo apt-get -y remove indicator-me && killall gnome-panel &&
# clean up yo stuffs
cd ~/Desktop &&
sudo rm libevent* -rf && sudo rm phpsh -rf &&
sudo apt-get -y autoclean && sudo apt-get -y autoremove && sudo apt-get -y clean && sudo apt-get -y remove && sudo deborphan | args sudo apt-get -y remove --purge
# make nice folders
mkdir ~/www && mkdir ~/scripts &&
#git setup
git config --global user.name "dancrew32" &&
git config --global user.email dancrew32@gmail.com &&
sudo apt-get -y install meld &&
git config --global merge.tool "meld" &&
source ~/.bashrc && cd ~/ && clear && echo "All set!"

