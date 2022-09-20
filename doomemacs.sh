#!/usr/bin/env bash
# leehom Chen clh021@gmail.com
projUrl=https://github.com/doomemacs/doomemacs.git
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
	echo HOME=$home ./doomemacs/.emacs.d/bin/doom install
	HOME=$home ./doomemacs/.emacs.d/bin/doom install
fi

HOME=$home emacs
