function adbdbpush --description 'Push local db to android app database'
if test "$argv"
bash -c "adb push $argv[2] /sdcard/$argv[2]"
bash -c "adb shell run-as $argv[1] cp /sdcard/$argv[2] /data/data/$argv[1]/databases/$argv[2]"
else
echo 'Usage: adbdbpush <package_name> <db_name>'
end
end
