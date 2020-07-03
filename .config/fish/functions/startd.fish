function startd --description 'Start user space systemd service'
if test "$argv"
systemctl --user start "$argv"
else
echo 'Usage:'
echo "startd <unit.service>"
end
end
