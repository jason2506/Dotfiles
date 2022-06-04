#!/usr/bin/env sh

. $( dirname "$0" )/config.cfg

set -ex

ln -s $root/.tmux.conf ~/.tmux.conf
ln -s $root/.tmux ~/.tmux
