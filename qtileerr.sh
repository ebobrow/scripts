#!/bin/bash

action=$(dunstify --action="view,View" "Qtile logs updated")

case $action in
	'view')
		alacritty -e "vim ~/.local/share/qtile/qtile.log"
esac
