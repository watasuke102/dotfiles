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
[[ ! -e ~/.git-prompt.sh ]] && curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh 

installer_tmp=$(mktemp)
[[ ! -e ~/.cache/dein ]] && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ${installer_tmp} && ${installer_tmp} ~/.cache/dein

echo -e "\033[36m[info] Creating symlink...\033[39m"
ln -snvf  ${current}/.zshrc     ~/.zshrc
ln -snvf  ${current}/.aliases   ~/.aliases
ln -snvf  ${current}/.func      ~/.func
ln -snvf  ${current}/.tmux.conf ~/.tmux.conf
ln -snvfd ${current}/nvim       ~/.config/nvim

echo -e "\033[32m[info] All done!\033[32m"

