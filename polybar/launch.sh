#!/usr/bin/env bash

# Terminate existing instances
polybar-msg cmd quit

if type "xrandr" > /dev/null; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload bottom &
	done
else
	polybar --reload bottom &
fi
