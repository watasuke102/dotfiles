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

ln -sf  program/dotfiles/.zshrc     ~/.zshrc
ln -sf  program/dotfiles/.zshrc     ~/.zshrc
ln -sf  program/dotfiles/.aliases   ~/.aliases
ln -sf  program/dotfiles/.func      ~/.func
ln -sf  program/dotfiles/.tmux.conf ~/.tmux.conf
ln -sdf program/dotfiles/nvim       ~/.config/nvim

echo "All done!"

