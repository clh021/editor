#!/usr/bin/env bash
# leehom Chen clh021@gmail.com
projUrl=https://github.com/syl20bnr/spacemacs.git
set -e
cd "$( dirname "${BASH_SOURCE[0]}" )"
currentPath="$(pwd)"
filenameExt="$(basename "$0")"
filename="${filenameExt%%.*}"
conf=$currentPath/$filename/.emacs.d/init.el
home=$currentPath/$filename/

if ! test -f "$conf"; then
	mkdir -p "$( dirname "$conf" )"
	git clone --depth=1 $projUrl "$(dirname "$conf")"
fi

HOME=$home emacs
