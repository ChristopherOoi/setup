#!/bin/bash

# install zsh and oh-my-zsh if not already installed
if [ ! -d ~/.oh-my-zsh ]; then
    sudo apt-get install zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install vim if not already installed
if [ ! -d ~/.vim ]; then
    sudo apt-get install vim
fi

# copy .vimrc and .zshrc to home directory
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

# change default shell to zsh
chsh -s /bin/zsh

# source .zshrc
source ~/.zshrc

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugins
vim +PluginInstall +qall

# compile YouCompleteMe
sudo apt install build-essential cmake3 python3-dev
sudo apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all