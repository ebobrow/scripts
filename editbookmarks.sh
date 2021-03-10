#!/bin/bash

choice=$(sed "/^$/ d" ~/.NERDTreeBookmarks | dmenu -h 25 -fn 'mononoki Nerd Font:style=Bold' -i -l 20 -p 'Open bookmark:')

if [[ "$choice" ]]; then
	echo $choice
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	nvim --cmd "cd $cfg" -c "NERDTree"
else
	echo "Program terminated" && exit 1
fi
