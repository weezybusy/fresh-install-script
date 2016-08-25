#!/bin/bash

echo "Installing packages..."
apps='alsa-utils compton xbacklight lxappearance fonts-droid pcmanfm '
apps+='gcc valgrind glibc-source make vim virtualenv python3-pip '
apps+='firefox-esr moc deluge weechat htop youtube-dl scrot qalculate'
sudo apt -y install $apps
pip3 install --user tmuxp
echo "Done!"

echo "Cloning repos..."
git clone https://github.com/weezybusy/dotfiles.git ~/Templates/dotfiles
git clone https://github.com/morhetz/gruvbox.git ~/Templates/gruvbox
git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme-gtk.git ~/Templates/papirus
echo "Done!"

echo "Setting links..."
ln -svf /media/$USER/stuff/mus/{salad,jazz} ~/Music
ln -svf /media/$USER/work/{playground,salad,kr2,atbswp} ~/Documents
ln -svf
~/Templates/dotfiles/{.bash_aliases,.bashrc,.gdbinit,.gitconfig,.vimrc,.Xresources,.i3status.conf} ~/
ln -svf ~/Templates/dotfiles/compton.conf ~/.config
mkdir ~/.vim
ln -svf ~/Templates/gruvbox/colors ~/.vim
mkdir ~/.i3
ln -svf ~/Templates/dotfiles/.i3/config ~/.i3
mocp -S
ln -svf ~/Templates/dotfiles/.moc/config ~/.moc
mkdir ~/.icons
ln -svf ~/Templates/papirus/Papirus-GTK ~/.icons
echo "Done!"

echo "Unpacking glibc-source..."
sudo tar -xf /usr/src/glibc/glibc-2.19.tar.xz -C /usr/src/glibc
echo "Done!"

echo "Setting up cron..."
crontab -e
echo "Done!"

echo "Fix hanging on copying large files..."
sudo vi /etc/rc.local
echo "Done!"
