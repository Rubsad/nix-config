#!/usr/bin/env bash

url=$(cat ~/.local/upload_url.txt)
screenshot_path="$(xdg-user-dir PICTURES)/screenshot.png"
screenshot_area=""

case $1 in
area)
	screenshot_area=$(slurp)
	;;

window)
	json=$(hyprctl activewindow -j)
	wx=$(echo "$json" | jq '.at[0]' --raw-output)
	wy=$(echo "$json" | jq '.at[1]' --raw-output)
	ww=$(echo "$json" | jq '.size[0]' --raw-output)
	wh=$(echo "$json" | jq '.size[1]' --raw-output)
	screenshot_area="${wx},${wy} ${ww}x${wh}"
	;;

screen)
	json=$(hyprctl monitors -j)
	sx=$(echo "$json" | jq -r '.[] | select(.focused) | .x' --raw-output)
	sy=$(echo "$json" | jq -r '.[] | select(.focused) | .y' --raw-output)
	sw=$(echo "$json" | jq -r '.[] | select(.focused) | .width' --raw-output)
	sh=$(echo "$json" | jq -r '.[] | select(.focused) | .height' --raw-output)
	screenshot_area="${sx},${sy} ${sw}x${sh}"
	;;

*)
	echo Invalid argument
	exit 1
	;;
esac

if ! grim -g "$screenshot_area" "$screenshot_path"; then
	notify-send Screenshot "Canceled"
	exit 1
fi

if ! json=$(curl -X POST -F "file=@$screenshot_path" "$url" -o-); then
	notify-send Screenshot "Upload Failed"
	exit 1
fi

echo "$json" | jq '.url' --raw-output | wl-copy -n

notify-send Screenshot "Screenshot url was copied to the clipboard!"