# Dot Fizzles.

These are some dot files/folders I want to maintain between multiple computers.

### Stuff like:
* bashrc, inputrc, vimrc
* vim plugins that I dig
* install scripts to put a fresh ubuntu 11.04 distro to my happy place.

### Installations:
To run the install script, just:

	cd ~/
	sudo apt-get -y install git &&
    git clone git://github.com/dancrew32/dotfiles.git &&
    cd dotfiles &&
    sudo ./install/freshDistro.sh
