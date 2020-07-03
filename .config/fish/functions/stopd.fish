function stopd --description 'Start user space systemd service'
if test "$argv"
systemctl --user stop "$argv"
else
echo 'Usage:'
echo "stopd <unit.service>"
end
end
