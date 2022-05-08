#!/bin/bash
# Shows a run menu with calculator support.
# Deps:
#   - rofi (can easily be converted to dmenu)
#   - bc or python (either version 2 or 3) for calculations
#   - notification system setup (`notify-send` should work properly)
# Running:
#   - Save the file to anything.sh
#   - chmod +x anything.sh
#   - ./anything.sh
#   - It should show a menu with executables. Input app name or math. Enjoy!
#     If you enter math, it should show the result as a notification.
#     Otherwise should run the program you selected.
# Example input: geany, 2+2, 2-1, 10/3, 2*2=, (3^2)*10

input=$( find ${PATH//:/ } -maxdepth 1 -executable -printf '%f\n' | rofi -show combi -i)
#input=$( find ${PATH//:/ } -maxdepth 1 -executable -printf '%f\n' | rofi -dmenu -i )

if grep -q '+\|-[[:digit:]]\|\*\|\/\|\^' <<<"$input"; then
	if [ -x "$(command -v bc)" ]; then # has bc package
		# If there is an equal sign (=) at the end, get rid of it.
		input=$(echo "$input" | sed 's/\=//g')
		# Show the result in a notification.
		notify-send "The result is: "$( echo $input | bc )
	elif [ -x "$(command -v python)" ]; then # has python package
		# If there is an equal sign (=) at the end, get rid of it.
		# Replace "^" with "**" so that it can calculate powers.
		input=$(echo "$input" | sed 's/\=//g;s/\^/**/g')
		# Show the result in a notification.
		# The `float(1)*` part is so that Python 2 returns decimal places.
		notify-send "The result is: "$( python -c "print( float(1)*$input )" )
	else
		notify-send "Neither bc nor python was found to do the calculations. Please install one of them."
	fi
else
	# Not a calculation, so run the command.
	$($input)
fi
