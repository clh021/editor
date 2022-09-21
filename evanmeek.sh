#!/usr/bin/env bash
# leehom Chen clh021@gmail.com
projUrl=https://github.com/EvanMeek/.emacs.d
set -e
cd "$( dirname "${BASH_SOURCE[0]}" )"
currentPath="$(pwd)"
filenameExt="$(basename "$0")"
filename="${filenameExt%.*}"
conf=$currentPath/$filename/.emacs.d/.dir-locals.el
home=$currentPath/$filename/

if ! test -f "$conf"; then
	mkdir -p "$( dirname "$conf" )"
	git clone --depth=1 $projUrl "$(dirname "$conf")"
	cd $home/.emacs.d
	git submodule update --init --recursive
fi

HOME=$home emacs
