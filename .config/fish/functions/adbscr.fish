function adbscr
if test "$argv"
adb shell /data/local/tmp/screencap -p /sdcard/$argv[1]
adb pull /sdcard/$argv[1]
adb shell rm /sdcard/$argv[1]
else
echo 'Usage: adbscr <filename>'
end
end
