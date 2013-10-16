#!/usr/bin/env sh

. $( dirname "$0" )/config.cfg

cd $root
git submodule foreach git pull origin master

