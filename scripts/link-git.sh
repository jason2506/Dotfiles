#!/usr/bin/env sh

. $( dirname "$0" )/config.cfg

set -ex

ln -s $root/.gitconfig ~/.gitconfig
ln -s $root/.gitignore ~/.gitignore
