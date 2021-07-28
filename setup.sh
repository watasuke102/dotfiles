#/usr/bin/env bash
echo "Following files and directory will be overwritten. Do you want to continue?"
echo "~/.zshrc"
echo "~/.zshrc"
echo "~/.aliases"
echo "~/.func"
echo "~/.tmux.conf"
echo "~/.config/nvim/"

echo -n "[y/N] "
read -n1 input 
[[ ${input} != "y" ]] && exit 1

cd $(dirname ${0})

echo "Downloading dependences..."
[[ ! -e ~/.git-prompt.sh ]] && curl https://0e0.pw/oHUu -o ~/.git-prompt.sh 
[[ ! -e ~/.cache/dein ]] && curl https://0e0.pw/BZMr | sh ~/.cache/dein

echo "Creating symlink..."
ln -sf  .zshrc     ~/.zshrc
ln -sf  .zshrc     ~/.zshrc
ln -sf  .aliases   ~/.aliases
ln -sf  .func      ~/.func
ln -sf  .tmux.conf ~/.tmux.conf
ln -sdf nvim       ~/.config/nvim

echo "All done!"

