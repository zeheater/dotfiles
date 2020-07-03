function adbdb --description 'Download android app database and shared prefs to current path'
if test "$argv"
mkdir -p $argv[1]
pushd $argv[1]
adb exec-out run-as $argv[1] tar c databases/ shared_prefs/ | tar xf -
popd
else
echo 'Usage: adbdb <package_name>'
end
end
