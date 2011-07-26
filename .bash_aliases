# Extract
function extract() {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#my ip address
alias myip='curl ip.appspot.com'
function localip() {
ifconfig | sed -ne 's/^.*inet \(addr:\)*\([^ ]*\).*/\2/;te' -e 'd;:e' -e '/^127\./d;p'
}

#tarballs
function maketarball() {
tar -zcvf "$2.tar.gz" "$1" 
}

function opentarball() {
tar -zxvf "$1" 
}

# git
alias gitcount='git shortlog -s -n'
function gitstart() { 
	git init && git add . && git commit -m $@
}
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gcl='git clean -d -x'
alias gp='git push'
alias gu='git gui &'
alias gk='gitk &'
alias gr='git reflog'


#mozilla pango fix
export MOZ_DISABLE_PANGO=1

#set volume (param int 0-100)
alias v='aumix -v'

#reload bash
function restart() {
  source '~/.bashrc'
}

alias restart-gnome='sudo /etc/init.d/gdm restart'

alias svi='sudo vi'
alias edithosts='sudo vi /etc/hosts'
alias editvhosts='sudo vi /etc/apache2/httpd.conf'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
# Directory x
# function ..(){ for ((j=${1:-1},i=0;i<j;i++));do builtin cd ..;done;}

## Dir shortcuts
alias home='cd ~'
alias web='cd ~/www'
alias logs='cd /var/log'
alias error='tail -f /var/log/apache2/error.log'
alias docs='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias pics='cd ~/Pictures'
alias dropbox='cd ~/Dropbox'
alias books='cd ~/Books'
alias videos='cd ~/Videos'
alias music='cd ~/Music'
alias desk='cd ~/Desktop'
alias scripts='cd ~/scripts'

## Sudo fixes
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias orphand='sudo deborphan | args sudo apt-get -y remove --purge'
alias cleanup='sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove && orphand'
alias updatedb='sudo updatedb'

## Dev related
alias apstop='sudo /etc/init.d/apache2 stop'
alias aprest='sudo /etc/init.d/apache2 restart'
alias apstart='sudo /etc/init.d/apache2 start'
alias mystop='sudo /etc/init.d/mysql stop'
alias myrest='sudo service mysql restart'
alias mystart='sudo service mysql start'
alias mystatus='sudo service mysql start'
#memcache
alias memstart='memcached -d -m 1024 -u root -l 127.0.0.1 -p 11211'


# file system aliases
alias na='nautilus'
alias o='gnome-open'
function mcd {
mkdir "$@" && cd "$@"; 
} 
alias mkdd='mkdir $(date +%Y%m%d)'

#CDrom stuff
alias opencd='eject cdrom'
alias closecd='eject -t cdrom'

#HDtemp
alias hdtemp='sudo hddtemp /dev/sda'

# Added by autojump install.sh
source /etc/profile.d/autojump.bash

#loop stuff n times
function loop() {
	n=$1
    shift
    while [ $(( n -= 1 )) -ge 0 ]
    do
        "$@"
    done
}

# dotfile editing
alias ebrc='vi ~/.bashrc && source ~/.bashrc'
alias gebrc='gedit ~/.bashrc && source ~/.bashrc'
alias todo='vi ~/Desktop/.todo'

#espeak
function say() {
	$@ | espeak -v mb-us2 -s 100 -p 10
}

#vim aliases
alias evrc='vi ~/.vimrc && source ~/.vimrc'
alias v='/usr/local/bin/v'

#mysql
alias msc='mysql -uroot -p'

#php 
alias editini='sudo vi /etc/php5/apache2/php.ini'

#drupal
alias ddra='drush dcss-reset all'
alias dcca='drush cc all'
alias dr='cd drupal/'
alias csson='drush vset preprocess_css 1 -y'
alias cssoff='drush vset preprocess_css 0 -y'

#html validate <errorfile.txt> <htmlfile.html>
alias htmlval='tidy -errors -q -f'

# tomcat
alias tomcat-start='sudo /etc/init.d/tomcat6 start'
alias tomcat-stop='sudo /etc/init.d/tomcat6 stop'
alias tomcat-restart='sudo /etc/init.d/tomcat6 restart'

#combinepdf <1.pdf> <2.pdf> <3.pdf>
alias combinepdf='gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combined_pdf.pdf -dBATCH'

#combinevideo <output.avi> <1.avi> <2.avi> <3.avi>
alias combinevideo='mencoder -forceidx -ovc copy -oac copy -o'

#properly redshift
function red() {
redshift -l 37.7989006042:-122.398399353 &
}

#tether micro
function tetherme() {
easytether enumerate && easytether connect
}

# Xdotool aliases
function mousepos() {
while :; do xdotool getmouselocation; sleep .3; done
}
alias xdt='xdotool'

#Beep aliases
function be() {
beep -f $1 -l $2
}

function compcss() {
yui-compressor --type css -v -o$2 $1
}
function compjs() {
yui-compressor --type js -v -o$2 $1
}

#webcam
function mirror() {
mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0:fps=30:outfmt=yuy2
}
export PATH=$HOME/local/bin:$PATH
export PATH=~/local/bin:${PATH}
export PATH=~/local/bin:$PATH
export PATH=/var/lib/gems/1.8/bin:$PATH


#connect to wifi
function scanwifi() {
sudo iwlist eth1 scan
}

function wificonnect() {
sudo iwconfig eth1 essid $1
}

function wificonnectkey() {
sudo iwconfig eth1 key $1
}

#Drrroid
export PATH=${PATH}:~/scripts/android-sdk-linux_x86/tools

#irc
alias irc='irssi'

#vimmode
set -o vi

#find, open in vi
function get() {
	find . -name "$@" -exec vi {} \;
}

# search and replace in file
function sr() {
sed 's/$1/$2/g'
}

#simple python serve folder
function serve() {
python -m SimpleHTTPServer
}
alias py='python'


#ruby on rails 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#screenshot
function screeny() {
gnome-screenshot -w -b -d 5 -e shadow
}

# path
function addToPath() {
	export PATH=$PATH:$@
}

#convert MKV
function mkvtoavi() {
	ffmpeg -i $1 -vcodec copy -acodec copy $2
}
