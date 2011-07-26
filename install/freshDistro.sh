#!/bin/bash
# I assume you have git already if you've downloaded this file...
cp .bashrc .vimrc .bash_aliases .inputrc ~/ &&
cp -R .vim ~/.vim &&
cd ~/Desktop &&
# get latest first...
sudo echo "deb http://dl.google.com/linux/deb/ stable non-free main" | tee -a /etc/apt/sources.list &&
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&
sudo apt-get update && sudo apt-get upgrade &&
# base stuff
sudo apt-get install build-essential ubuntu-restricted-extras vim python ruby rubygems ruby1.8-dev msttcorefonts google-chrome-stable tasksel && 
sudo gem update --system && sudo gem update && sudo gem install rake &&
# safe rm
wget the file http://safe-rm.googlecode.com/files/safe-rm-0.8.tar.gz &&
tar zvxf safe-rm-0.8.tar.gz &&
cd safe-rm-0.8 &&
mv /bin/rm /bin/old-rm &&
mv safe-rm /bin/rm &&
#php stuff
sudo tasksel install lamp-server && 
sudo apt-get install phpmyadmin &&
sudo a2enmod rewrite &&
wget http://www.monkey.org/~provos/libevent-1.4.8-stable.tar.gz &&
#memcached
tar xfz libevent-1.4.8-stable.tar.gz &&
cd libevent-1.4.8-stable &&
./configure && make && sudo make install &&
sudo ln -s /usr/local/lib/libevent-1.4.so.2 /usr/lib &&
wget http://danga.com/memcached/dist/memcached-1.2.6.tar.gz &&
tar xfz memcached-1.2.6.tar.gz &&
cd memcached-1.2.6 &&
./configure && make && sudo make install &&
apt-get install php5-memcache &&
apt-get install php-pear &&
apt-get install php5-cli &&
wget http://www.phpsh.org/phpsh-latest.tgz &&
tar xvfz phpsh-latest.tgz &&
cd phpsh && chmod 755 phpsh && sudo python setup.py build && sudo python setup.py install && cd ~/Desktop &&
# update font cache
sudo fc-cache -fv &&
# get more cool stuff
sudo apt-get install redshift virtualbox-ose moc filezilla &&
sudo gem install vimgolf &&
# get rid of suck
sudo apt-get remove --purge rhythmbox gwibber gwibber-service evolution &&
sudo apt-get remove evolution-indicator && sudo apt-get remove indicator-messages &&
sudo apt-get remove indicator-me && killall gnome-panel
