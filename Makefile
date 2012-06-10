all: vim git bash

vim:
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`/vim ~/.vim

vim-update:
	git submodule foreach git pull origin master

git:
	ln -s `pwd`/gitconfig ~/.gitconfig
	ln -s `pwd`/gitignore ~/.gitignore

bash:
	ln -s `pwd`/bash_profile ~/.bash_profile

