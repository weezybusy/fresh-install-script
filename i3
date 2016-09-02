#!/bin/bash

echo "Installing packages..."
apps='alsa-utils compton xbacklight pcmanfm firefox-esr moc deluge '
apps+='gcc valgrind glibc-source make vim htop scrot qalculate '
apps+='python3-pip virtualenv python3-bs4 python3-requests p7zip-full'
sudo apt -y install $apps
pip3 install --user tmuxp youtube-dl
echo "Done!"

echo "Cloning repos..."
git clone https://github.com/morhetz/gruvbox.git ~/Templates/gruvbox
git clone https://github.com/weezybusy/utils ~/Templates/utils
echo "Done!"

echo "Setting links..."
ln -svf /media/$USER/stuff/mus/{salad,jazz} ~/Music
ln -svf /media/$USER/work/{playground,salad,kr2,atbswp} ~/Documents
ln -svf ~/Templates/dotfiles/{.bash_aliases,.bashrc,.gdbinit,.gitconfig,.vimrc,.Xresources,.i3status.conf} ~/
ln -svf ~/Templates/dotfiles/compton.conf ~/.config
mkdir ~/.vim
ln -svf ~/Templates/gruvbox/colors ~/.vim
mkdir ~/.i3
ln -svf ~/Templates/dotfiles/.i3/config ~/.i3
mocp -S
ln -svf ~/Templates/dotfiles/.moc/config ~/.moc
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
