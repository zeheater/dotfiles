function rdp
    #rdesktop -g 1920x1050 -u zeheater 172.19.88.38
    rdesktop -r sound:local:alsa -r clipboard:PRIMARYCLIPBOARD -xl $argv
end
