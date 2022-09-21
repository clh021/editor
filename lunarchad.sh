#!/usr/bin/env bash
# leehom Chen clh021@gmail.com
# depends:
#   - vim/neovim +python3
#   - git
#   - curl
#
set -e
cd "$( dirname "${BASH_SOURCE[0]}" )"
currentPath="$(pwd)"
filenameExt="$(basename "$0")"
filename="${filenameExt%.*}"
conf=$currentPath/$filename/.local/bin/lvim
export HOME=$currentPath/$filename/

if ! test -f "$conf"; then
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
  mv ~/.config/lvim/ ~/.config/lvim.old/
  git clone https://github.com/ViktorBusk/LunarChad.git ~/.config/lvim/
fi

export PATH=$HOME/.local/bin:$PATH
lvim

