#!/bin/bash

service_names=(
"postgresql.service"
"bluetooth.service"
"dhcpcd.service"
)
declare -a services

for i in "${!service_names[@]}"; do
	active=$(systemctl is-active "${service_names[$i]}")
	services[$i]="${service_names[$i]} ($active)"
done

choice=$(printf '%s\n' "${services[@]}" | dmenu -h 25 -fn 'mononoki Nerd Font:style=Bold' -i -l 20 -p 'Start/stop service:')

if [[ "$choice" ]]; then
	service=$(echo $choice | awk '{print $1}')
	active=$(echo $choice | awk '{print $2}')

	if [[ "$active" == "(active)" ]]; then
		systemctl stop "$service"

	else
		systemctl start "$service"
	fi

else
	exit 1
fi
