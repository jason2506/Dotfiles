#!/usr/bin/env sh

. $( dirname "$0" )/config.cfg

set -ex

ln -s $root/.config/fish/config.fish ~/.config/fish/config.fish
