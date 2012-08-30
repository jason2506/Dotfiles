all: vim git bash

vim:
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`/vim ~/.vim

vim-update:
	git submodule foreach git pull origin master

git:
	ln -s `pwd`/gitconfig ~/.gitconfig
	ln -s `pwd`/gitignore ~/.gitignore

fish:
	ln -s `pwd`/config.fish ~/.config/fish/config.fish

