function passrand --description 'Generate random password'
if test "$argv"
tr -dc 'A-Za-z0-9!#$%&+,-/:;<=>^_|' </dev/urandom | head -c "$argv[1]"
# tr -dc 'A-Za-z0-9!#$%&+,-/:;<=>@^_|' </dev/urandom | head -c "$argv[1]"
# tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c "$argv[1]"
else
echo 'Usage: passrand <length>'
end
end
