#!/usr/bin/env bash

echo -ne "\033[32m"
echo "========================================="
echo " Dotfiles - watasuke102                  "
echo " https://github.com/watasuke102/dotfiles "
echo "========================================="
echo -ne "\033[39m"

cat << END
Following files and directory will be overwritten.
 * ~/.func
 * ~/.zshrc
 * ~/.aliases
 * ~/.gdbinit
 * ~/.tmux.conf
 * ~/.config/xremap.yml
 * ~/.config/ags/
 * ~/.config/hypr/
 * ~/.config/nvim/
 * ~/.config/rofi/
 * ~/.config/dunst/
 * ~/.config/lazygit/
 * ~/.config/alacritty/
END

echo -n "Do you want to continue? [y/N] "
read -n1 input
echo
if [[ ${input} != "y" ]]; then
  echo "aborting."
  exit 1
fi

current=$(cd $(dirname ${0}); pwd)

if [[ ! -e ~/.cache/dein ]]; then
  echo -e "\033[36m[info] Setting up dein.vim...\033[39m"
  installer_tmp=$(mktemp)
  curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh -o "$installer_tmp"
  echo 1 | sh ${installer_tmp} -uNC
  mv ~/.config/nvim/init.vim.pre-dein-vim ~/.config/nvim/init.vim
  rm -f ${installer_tmp}
fi

if [[ ! -e ~/.gdb-dashboard ]]; then
  echo -e "\033[36m[info] Downloading '.gdb-dashboard'...\033[39m"
  curl https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit -o ~/.gdb-dashboard
fi

if [[ ! -e ~/.git-prompt.sh ]]; then
  echo -e "\033[36m[info] Downloading '.git-prompt.sh'...\033[39m"
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

if ! grep -Eq "path = .+/dotfiles/\.gitconfig" ~/.gitconfig; then
  echo -e "\033[36m[info] Setting up gitconfig...\033[39m"
  cat << END >> ~/.gitconfig
[include]
	path = ${current}/.gitconfig
END
fi

echo -e "\033[36m[info] Creating symlink...\033[39m"
mkdir -p ~/.config
ln -snvf  ${current}/.func      ~/.func
ln -snvf  ${current}/.zshrc     ~/.zshrc
ln -snvf  ${current}/.aliases   ~/.aliases
ln -snvf  ${current}/.gdbinit   ~/.gdbinit
ln -snvf  ${current}/.tmux.conf ~/.tmux.conf

ln -snvf  ${current}/.config/xremap.yml ~/.config/xremap.yml
ln -snvfd ${current}/.config/ags        ~/.config/ags
ln -snvfd ${current}/.config/hypr       ~/.config/hypr
ln -snvfd ${current}/.config/nvim       ~/.config/nvim
ln -snvfd ${current}/.config/rofi       ~/.config/rofi
ln -snvfd ${current}/.config/dunst      ~/.config/dunst
ln -snvfd ${current}/.config/lazygit    ~/.config/lazygit
ln -snvfd ${current}/.config/polybar    ~/.config/polybar
ln -snvfd ${current}/.config/alacritty  ~/.config/alacritty

echo -e "\033[36m[info] initialize config files...\033[39m"
touch ~/.config/hypr/screen.conf

echo -e "\033[32m[info] All done!\033[32m"

