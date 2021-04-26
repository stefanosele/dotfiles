#! /bin/bash
clear

CPY='ln -sf'

# Remove existing configs
printf '\n** Preparing install **'
rm $HOME/.vimrc
rm $HOME/.gitconfig
rm -rf $HOME/.config/nvim/
# rm -rf $HOME/.vim

# Copy conf files (symlinks)
# $CPY $PWD/zsh/zshrc $HOME/.zshrc
$CPY $PWD/vimrc $HOME/.vimrc
# $CPY $PWD/gitconfig $HOME/.gitconfig

# Vim configuration
printf '\n** Configuring vim **'
mkdir $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PlugInstall +qall

if [ `which nvim` ];
then
	printf '\n** Configuring neo-vim **'
 	mkdir -p $HOME/.config/nvim
	$CPY $PWD/init.vim $HOME/.config/nvim/init.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
	vim +PlugInstall +qall
fi
