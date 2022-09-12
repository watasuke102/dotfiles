#/usr/bin/env bash

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
 * ~/.tmux.conf
 * ~/.config/i3
 * ~/.config/nvim/
 * ~/.config/rofi/
 * ~/.config/dunst/
 * ~/.config/polybar/
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

echo -e "\033[36m[info] Downloading '.git-prompt.sh'...\033[39m"
if [[ ! -e ~/.git-prompt.sh ]]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

echo -e "\033[36m[info] Setting up dein.vim...\033[39m"
installer_tmp=$(mktemp)
if [[ ! -e ~/.cache/dein ]]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ${installer_tmp}
  chmod +x ${installer_tmp}
  ${installer_tmp} ~/.cache/dein
  rm -f ${installer_tmp}
fi

echo -e "\033[36m[info] Creating symlink...\033[39m"
ln -snvf  ${current}/.func      ~/.func
ln -snvf  ${current}/.zshrc     ~/.zshrc
ln -snvf  ${current}/.aliases   ~/.aliases
ln -snvf  ${current}/.tmux.conf ~/.tmux.conf

ln -snvfd ${current}/.config/i3        ~/.config/i3
ln -snvfd ${current}/.config/nvim      ~/.config/nvim
ln -snvfd ${current}/.config/rofi      ~/.config/rofi
ln -snvfd ${current}/.config/dunst     ~/.config/dunst
ln -snvfd ${current}/.config/polybar   ~/.config/polybar
ln -snvfd ${current}/.config/alacritty ~/.config/alacritty

echo -e "\033[32m[info] All done!\033[32m"

