function kawal
    # Create a temporary file to hold the Redis value.
    set tmpfile (mktemp -t kawalan.XXXXXXXX)

    begin
    set master_ip (redis-cli -h 97.74.80.174 -p 26380 --tls --key ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.pem --cert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.crt --cacert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/rootCA.crt SENTINEL get-master-addr-by-name superproject | awk 'NR==1 {print $1}' | tr -d '"')
    redis-cli --no-auth-warning --pass 'n62<O!B%4wFdNMjDjw;bexnopvvq5=.zQ1$>Q.aP:R/Ac$$WrsToRw0%Ar-cdc&H' -h $master_ip -p 6380 --tls --key ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.pem --cert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.crt --cacert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/rootCA.crt GET list:antrian | js-beautify -s 2
    end > $tmpfile

    set initial_hash (sha256sum < $tmpfile)

    /usr/bin/nvim -c "set filetype=json" $tmpfile
    
    set final_hash (sha256sum < $tmpfile)
    # Compare the initial and final hashes.
    if test "$initial_hash" = "$final_hash"
        echo "No changes detected."
    else
        echo "Changes detected. Publishing..."
        redis-cli --no-auth-warning --pass 'n62<O!B%4wFdNMjDjw;bexnopvvq5=.zQ1$>Q.aP:R/Ac$$WrsToRw0%Ar-cdc&H' -h $master_ip -p 6380 --tls --key ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.pem --cert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.crt --cacert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/rootCA.crt -x PUBLISH stream:kawal < $tmpfile
        redis-cli --no-auth-warning --pass 'n62<O!B%4wFdNMjDjw;bexnopvvq5=.zQ1$>Q.aP:R/Ac$$WrsToRw0%Ar-cdc&H' -h $master_ip -p 6380 --tls --key ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.pem --cert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/client.crt --cacert ~/projects/ARTHAPUNDIREZEKI/projectkawal/rediscerts/rootCA.crt -x SET list:antrian < $tmpfile
        echo "Done."
    end

    if test -f $tmpfile
        rm $tmpfile
    end
end
