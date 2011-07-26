#!/bin/bash
cd ~/Desktop &&
sudo apt-get install build-essential msttcorefonts safe-rm chromium-browser git tasksel && 
sudo tasksel install lamp-server && 
sudo apt-get install phpmyadmin &&
sudo a2enmod rewrite &&
wget http://www.monkey.org/~provos/libevent-1.4.8-stable.tar.gz &&
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
apt-get install php5-cli python &&
wget http://www.phpsh.org/phpsh-latest.tgz &&
tar xvfz phpsh-latest.tgz &&
cd phpsh && chmod 755 phpsh && sudo python setup.py build && sudo python setup.py install && cd ~/Desktop &&
sudo fc-cache -fv &&
sudo apt-get install redshift virtualbox-ose moc &&
sudo apt-get remove --purge rhythmbox gwibber 


