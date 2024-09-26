#!/bin/bash

# copy updated .vimrc and .zshrc to this directory
cp ~/.zshrc .
cp ~/.vimrc .
cp ~/.vim/coc-settings.json .

# commit changes
git add .zshrc .vimrc coc-settings.json
git commit -m "Update settings"
git push
