#!/usr/bin/env bash
# leehom Chen clh021@gmail.com
set -e
cd "$( dirname "${BASH_SOURCE[0]}" )"
currentPath=`pwd`
conf=$currentPath/spacemacs/.emacs.d/init.el
home=$currentPath/spacemacs/

if ! test -f "$conf"; then
	mkdir -p $( dirname $conf )
	git clone --depth=1 https://github.com/syl20bnr/spacemacs.git spacemacs/.emacs.d
fi

HOME=$home emacs
