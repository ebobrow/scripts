#!/bin/bash

declare -a options=(
"Restart"
"Shut down"
"Cancel"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -h 25 -fn "mononoki Nerd Font:style=Bold" -i -p 'Shutdown:')

case $choice in
	'Restart')
		answer="$(echo -e "No\nYes" | dmenu -h 25 -fn "mononoki Nerd Font:style=Bold" -i -p 'Restart?')"
		if [[ $answer == "Yes" ]]; then
			systemctl reboot
		fi

		if [[ $answer == "No" ]]; then
			echo "Terminating process" && exit 1
		fi
		;;
	'Shut down')
		answer="$(echo -e "No\nYes" | dmenu -h 25 -fn "mononoki Nerd Font:style=Bold" -i -p 'Shut down?')"
		if [[ $answer == "Yes" ]]; then
			systemctl poweroff
		fi

		if [[ $answer == "No" ]]; then
			echo "Terminating process" && exit 1
		fi
		;;
esac
