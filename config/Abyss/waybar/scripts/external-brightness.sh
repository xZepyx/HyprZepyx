#!/bin/bash

# Change `--bus X` below with the number of your monitor bus, detected with `ddcutil detect`
percentage=$(ddcutil getvcp 10 --sleep-multiplier .1 --bus 3 --noverify | awk -F "current value =   " '{ print $2 }' | awk -F "," '{ print $1 }')

if [[ $percentage < "10" ]]; then
	icon=""
elif (($percentage <= "20")); then
	icon=""
elif (($percentage <= "30")); then
	icon=""
elif (($percentage <= "40")); then
	icon=""
elif (($percentage <= "50")); then
	icon=""
elif (($percentage <= "60")); then
	icon=""
elif (($percentage <= "70")); then
	icon=""
elif (($percentage <= "80")); then
	icon=""
else
	icon=""	
fi

echo "<span size='13000'>$icon</span>$percentage%"
