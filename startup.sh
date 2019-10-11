#!/bin/bash

############################################
# Run and go make tea :)
# When you back everything will be installed
############################################

NAME="Volodymyr Fialko"
GMAIL="volodymyrf@interfacemasters.com"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -e|--editional)
    EDITIONAL=1
    shift # past argument
    ;;
    -s|--searchpath)
    SEARCHPATH="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

clang: error: no such file or directory: 'cmake'
echo "Installing packeges..."
sudo apt-get update

cat packages.txt | xargs sudo apt-get --yes install

echo "Finish Installing packeges..."

if [[ $EDITIONAL -eq 1 ]]
then

	GET_DOCKER=/tmp/get-docker.sh
	curl -fsSL https://get.docker.com -o $GET_DOCKER &&\
		sudo sh $GET_DOCKER &&\
		sudo usermod -aG docker ${USER}
	rm -f $GET_DOCKER

	sudo apt-get --yes install\
		skypeforlinux\

	echo "install discord"
	DISK_PATH=/tmp/discord.deb
	wget -O $DISK_PATH "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo dpkg -i $DISK_PATH
	sudo apt-get -yf install
	rm -f $DISK_PATH

	echo "Telegram installation..."
	wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/
	sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
fi

echo "Copy dotfiles"
DOTFILES=`pwd` 

mv ~/.vimrc ~/.vimrc_bkp
ln -s $DOTFILES/.vimrc ~/

mv ~/.bashrc ~/.bashrc_bkp
ln -s $DOTFILES/.bashrc ~/
source ~/.basrc

mkdir -p ~/.vim/colors
ln -s $DOTFILES/monokai.vim ~/.vim/colors/

echo "Tmux setup"
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
ln -s $DOTFILES/.tmux.conf ~/

mkdir -p ~/.fonts
ln -s $DOTFILES/Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono.ttf ~/.fonts/
fc-cache -f -v

echo "Git globals"
git config --global user.email "$GMAIL"
git config --global user.name "$NAME"
ln -sf $DOTFILES/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "Vundle installing..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "FZF installing..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "LS_COLORS installing..."
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
