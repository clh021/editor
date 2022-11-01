#!/usr/bin/env bash
# leehom Chen clh021@gmail.com
projUrl=https://github.com/doom-neovim/doom-nvim.git
set -e
cd "$( dirname "${BASH_SOURCE[0]}" )"
currentPath="$(pwd)"
filenameExt="$(basename "$0")"
filename="${filenameExt%.*}"
conf=$currentPath/$filename/.config/nvim/init.lua
home=$currentPath/$filename/

export https_proxy=http://192.168.1.128:1085
export http_proxy=http://192.168.1.128:1085
export all_proxy=http://192.168.1.128:1085

if ! test -f "$conf"; then
	mkdir -p "$( dirname "$conf" )"
	git clone --depth=1 $projUrl "$(dirname "$conf")"
	echo HOME=$home ./doomnvim/.config/nvim/tools/install.sh
	HOME=$home ./doomnvim/.config/nvim/tools/install.sh
fi

HOME=$home nvim
