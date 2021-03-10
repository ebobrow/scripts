#!/bin/bash

logs=$(tail ~/.local/share/qtile/qtile.log)
dunstify "$logs"
