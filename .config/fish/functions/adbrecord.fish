# Defined in /tmp/fish.icj4jt/adbrecord.fish @ line 2
function adbrecord
	if test "$argv"
		adb shell screenrecord $argv[1]
	else
		echo 'Usage: adbrecord <internal phone path>'
	end
end
