#!/bin/bash

#current dir
dotFileDir=$(pwd)

echo $USER

function linkDotFile {
  #get location of dotfile in home dir
  dest="${HOME}/${1}"
  echo ${HOME}/${1}
  #save date for backup
  dateStr=$(date +%Y-%m-%d-%H%M)
  
  if [ -L ~/${1} ]; then
    #existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}
  
  elif [ -f "${dest}" ]; then
    #existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}
    
  elif [ -d "${dest}" ]; then
    #existing dir
    echo "Backing up existing directory: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi
  
  echo "Creating new symlink: ${dest}"
  ln -s ${dotFileDir}/${1} ${dest}
  printf '\n'
}

linkDotFile .bashrc
linkDotFile .gitconfig
linkDotFile .vimrc
