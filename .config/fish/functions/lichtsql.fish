# Defined via `source`
function lichtsql --wraps='mysql --ssl-cert ~/Desktop/key/lichtschein/mariadbssl/ssl/client-cert.pem --ssl-key ~/Desktop/key/lichtschein/mariadbssl/ssl/client-key.pem -h lichtschein.id -Dlichtschein -P 3306 -u zeheater -p' --description 'alias lichtsql mysql --ssl-cert ~/Desktop/key/lichtschein/mariadbssl/ssl/client-cert.pem --ssl-key ~/Desktop/key/lichtschein/mariadbssl/ssl/client-key.pem -h lichtschein.id -Dlichtschein -P 3306 -u zeheater -p'
  mysql --ssl-ca ~/Desktop/key/lichtschein/mariadbssl/ssl/ca-cert.pem --ssl-cert ~/Desktop/key/lichtschein/mariadbssl/ssl/client-cert.pem --ssl-key ~/Desktop/key/lichtschein/mariadbssl/ssl/client-key.pem -h lichtschein.id -Dlichtschein -P 3306 -u zeheater -p $argv; 
end
