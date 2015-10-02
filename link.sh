#!/bin/bash

# links all dotfiles to the current users home directory,
# backing up any current files that exist

# Author Chris Pergrossi
# GPG License

for F in $(pwd)/\.*; do
	[ -e "$HOME/$F" ] mv "$HOME/$F" "$HOME/$F.bak"

	ln -s "`pwd`/$F" "$HOME/$F"
done
