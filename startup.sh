#!/bin/bash

set -e

echo "Linking dotfiles..."
DOTFILES=`pwd` 

declare -A links

links[".vimrc"]="vim/.vimrc"
links[".vim/colors"]="vim/colors"
links[".gitignore_global"]=".gitignore_global"
links[".bashrc"]=".bashrc"
links[".bash_aliases"]=".bash_aliases"
links[".tmux.conf"]="tmux/.tmux.conf"
links[".gitconfig"]="git/gitconfig"
links[".gitignore_global"]="git/gitignore_global"

mkdir -p ~/.vim/colors
for key in "${!links[@]}"; do
	echo "ln -sf "$DOTFILES/${links[$key]}" ~/$key"
	rm -rf ~/$key
	ln -sf "$DOTFILES/${links[$key]}" ~/$key
done
