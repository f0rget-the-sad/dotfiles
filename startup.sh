sudo apt install vim vim-gtk git fonts-powerline
sudo apt-get install python-dev python3-dev python-pip python-tk build-essential cmake okular tmux
echo "Copy dotfiles"
DOTFILES= ~/git/dotfiles
ln -s $DOTFILES/.bashrc ~/
ln -s $DOTFILES/.vimrc ~/
mkdir ~/.vim/colors
ln -s $DOTFILES/monokai.vim ~/.vim/colors

echo "Vundle installing..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "FZF installing..."
 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "YouCompleteMe building"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
