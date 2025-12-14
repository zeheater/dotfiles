function backupkawal
    mkdir -p /home/zeheater/projects/ARTHAPUNDIREZEKI/projectkawal/projectshuffle/haproxy
    pushd /home/zeheater/projects/ARTHAPUNDIREZEKI/projectkawal/projectshuffle/haproxy
    rsync -avi --info=PROGRESS2 projectshuffle:/etc/haproxy/ .
    popd
    mkdir -p /home/zeheater/projects/ARTHAPUNDIREZEKI/projectkawal/superprojectroot/haproxy
    pushd /home/zeheater/projects/ARTHAPUNDIREZEKI/projectkawal/superprojectroot/haproxy
    rsync -avi --info=PROGRESS2 superprojectroot:/etc/haproxy/ .
    popd
    mkdir -p /home/zeheater/projects/ARTHAPUNDIREZEKI/projectkawal/superprojectroot777/haproxy
    pushd /home/zeheater/projects/ARTHAPUNDIREZEKI/projectkawal/superprojectroot777/haproxy
    rsync -avi --info=PROGRESS2 superprojectroot777:/etc/haproxy/ .
    cd ../..
    begin
    redis-cli --no-auth-warning --pass 'n62<O!B%4wFdNMjDjw;bexnopvvq5=.zQ1$>Q.aP:R/Ac$$WrsToRw0%Ar-cdc&H' -h 97.74.80.174 GET list:antrian | js-beautify -s 2
    end > kawalan.json
    popd
end
