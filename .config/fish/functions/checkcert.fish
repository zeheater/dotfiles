function checkcert
openssl x509 -in $argv[1] -text -noout
end
