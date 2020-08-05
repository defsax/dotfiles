#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install git
install vim
install hugo
install firefox
install chromium-browser

install vlc
install gimp
install transmission
install lynx

#for XAMPP
install net-tools

#for fun
install figlet
install lolcat

#update all
sudo apt update && sudo apt upgrade && sudo apt autoremove
