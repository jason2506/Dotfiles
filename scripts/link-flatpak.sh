#!/usr/bin/env sh

. $( dirname "$0" )/config.cfg

set -ex

ln -s $root/.local/share/flatpak/overrides ~/.local/share/flatpak/overrides
