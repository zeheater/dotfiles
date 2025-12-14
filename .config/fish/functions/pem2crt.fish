function pem2crt
if test "$argv"
openssl x509 -outform der -in $argv[1] -out $argv[2]
else
echo 'Usage: pem2crt input.pem output.crt'
end
end
