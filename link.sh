#!/bin/bash

# links all dotfiles to the current users home directory,
# backing up any current files that exist

# Author Chris Pergrossi
# GPG License

# loop through all dot files
for F in \.*; do
	[[ "$F" == "."  ]] && continue
	[[ "$F" == ".."  ]] && continue
	[[ "$F" =~ \.git  ]] && continue

    # if file exists, store as backup
	[ -e "$HOME/$F" ] && mv "$HOME/$F" "$HOME/$F.bak"
    
    # symlink the dotfile so any changes can be commited
    ln -s "`pwd`/$F" "$HOME/$F"

done

# install awesome-vim
./awesome-vim.sh

# copy our colorscheme choice to VIM folder
ln -s "$(pwd)/my_configs.vm" "$HOME/.vim_runtime/"
