#!/usr/bin/env sh

. $( dirname "$0" )/config.cfg

cd $root
git submodule init
git submodule update
git submodule foreach git pull origin master

