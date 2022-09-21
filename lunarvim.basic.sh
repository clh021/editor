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
conf=$currentPath/$filename/.config/nvim/init.lua
export HOME=$currentPath/$filename/

if ! test -f "$conf"; then
  git clone --depth=1 https://github.com/LunarVim/nvim-basic-ide.git "$HOME/.config/nvim"
  # curl -sLf https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | bash
  # curl -sLf https://raw.fastgit.org/LunarVim/LunarVim/master/utils/installer/install.sh | bash
  # bash <(curl -s https://raw.fastgit.org/lunarvim/lunarvim/master/utils/installer/install.sh)
fi

# 优先启用 neovim, 其次是 vim
VimBin=
if ! command -v nvim &> /dev/null
then
  if ! command -v vim &> /dev/null
  then
    echo "Not found neovim and vim now..."
    exit 1
  else
    echo "Not found neovim, use vim now..."
    VimBin=$(which vim)
  fi
else
  VimBin=$(which nvim)
fi

$VimBin
