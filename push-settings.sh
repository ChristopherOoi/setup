#!/bin/bash

# copy updated .vimrc and .zshrc to this directory
cp ~/.zshrc .
cp ~/.vimrc .
cp ~/.vim/coc-settings.json .
cp ~/.tmux.conf .

# commit changes
git add .zshrc .vimrc coc-settings.json .tmux.conf
git commit -m "Update settings"
git push
