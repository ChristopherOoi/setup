#!/bin/bash

# get dotfiles from directory and copy them to home directory
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
if [ -d ~/.vim ]; then
	cp -r coc-settings.json ~/.vim/coc-settings.json
fi
