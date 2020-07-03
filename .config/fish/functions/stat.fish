function stat --description 'Check systemd user space services status'
if test "$argv"
systemctl --user status "$argv"
else
echo 'Usage:'
echo "stat <unit.service>"
end
end
