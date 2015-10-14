#!/bin/bash

# links all dotfiles to the current users home directory,
# backing up any current files that exist

# Author Chris Pergrossi
# GPG License

for F in \.*; do
	[[ "$F" == "."  ]] && continue
	[[ "$F" == ".."  ]] && continue
	[[ "$F" =~ \.git  ]] && continue

	[ -e "$HOME/$F" ] && mv "$HOME/$F" "$HOME/$F.bak"

	ln -s "`pwd`/$F" "$HOME/$F"
done
