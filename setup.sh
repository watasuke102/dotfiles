#/usr/bin/env bash

echo -ne "\033[32m"
echo "========================================="
echo " Dotfiles - watasuke102                  "
echo " https://github.com/watasuke102/dotfiles "
echo "========================================="
echo -ne "\033[39m"

cat << END
Following files and directory will be overwritten.
 * ~/.zshrc
 * ~/.aliases
 * ~/.func
 * ~/.tmux.conf
 * ~/.config/nvim/
END

echo -n "Do you want to continue? [y/N] "
read -n1 input 
echo 
[[ ${input} != "y" ]] && exit 1

current=$(cd $(dirname ${0}); pwd)

echo -e "\033[36m[info] Downloading dependences...\033[39m"
[[ ! -e ~/.git-prompt.sh ]] && curl https://0e0.pw/oHUu -o ~/.git-prompt.sh 
[[ ! -e ~/.cache/dein ]] && curl https://0e0.pw/BZMr | sh ~/.cache/dein

echo -e "\033[36m[info] Creating symlink...\033[39m"
ln -snvf  ${current}/.zshrc     ~/.zshrc
ln -snvf  ${current}/.aliases   ~/.aliases
ln -snvf  ${current}/.func      ~/.func
ln -snvf  ${current}/.tmux.conf ~/.tmux.conf
ln -snvfd ${current}/nvim       ~/.config/nvim

echo -e "\033[32m[info] All done!\033[32m"

