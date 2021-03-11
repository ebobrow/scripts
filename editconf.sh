#!/bin/bash

declare -a options=(
"alacritty - $HOME/.config/alacritty/alacritty.yml"
"fish - $HOME/.config/fish/config.fish"
"neovim - $HOME/.config/nvim/init.vim"
"vim - $HOME/.vimrc"
"qtile - $HOME/.config/qtile"
"xresources - $HOME/.Xresources"
"dunst - $HOME/.config/dunst/dunstrc"
"lf - $HOME/.config/lf/lfrc"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -h 25 -fn 'mononoki Nerd Font:style=Bold' -i -l 20 -p 'Edit config:')

if [[ "$choice" == "quit" ]]; then
	echo "Program terminated" && exit 1

elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	nvim "$cfg"

else
	echo "Program terminated" && exit 1
fi
