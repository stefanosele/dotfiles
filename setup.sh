#! /bin/bash
clear

CPY='ln -sf'

# Remove existing configs
printf '\n** Preparing install **'
rm $HOME/.vimrc
rm $HOME/.gitconfig
rm -rf $HOME/.config/nvim/
rm -rf $HOME/.vim
rm -rf $HOME/.bashrc
rm -rf $HOME/.bash_profile
rm -rf $HOME/.bash_aliases
rm -rf $HOME/.python_path

# Copy conf files (symlinks)
# $CPY $PWD/zsh/zshrc $HOME/.zshrc
$CPY $PWD/bashrc $HOME/.bashrc
$CPY $PWD/bash_profile $HOME/.bash_profile
$CPY $PWD/bash_aliases $HOME/.bash_aliases
$CPY $PWD/python_path $HOME/.python_path
$CPY $PWD/vimrc $HOME/.vimrc
$CPY $PWD/gitconfig $HOME/.gitconfig

# Vim configuration
printf '\n** Configuring vim **'
mkdir $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

NVIM_PATH=`which nvim`
if [ $NVIM_PATH ];
then
	printf '\n** Configuring neo-vim **'
 	mkdir -p $HOME/.config/nvim
	$CPY $PWD/init.vim $HOME/.config/nvim/init.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi
