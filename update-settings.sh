#!/bin/bash

# copy updated .vimrc and .zshrc to this directory
cp ~/.zshrc .
cp ~/.vimrc .

# commit changes
git add .zshrc .vimrc
git commit -m "Update settings"
git push