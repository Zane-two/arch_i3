#! /bin/bash

if [ "$(id -u)" != "0" ]
then
	echo "请确保你使用root权限启动此脚本"
	exit
fi

reflector --country China --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
sudo pacman -S yay
echo "[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf
sudo pacman -Syyu
sudo pacman -S archlinuxcn-keyring
yay -S picom-ibhagwan-git
yay -S rofi
yay -S libinput-gestures
gpasswd -a $USER input 
cp /etc/libinput-gestures.conf ~/.config/libinput-gestures.conf
yay -S ranger
yay -S fzf
yay -S zsh
yay -S alacritty

./copy.sh
./past.sh
