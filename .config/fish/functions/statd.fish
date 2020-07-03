# Defined in /tmp/fish.L1TndW/statd.fish @ line 1
function statd --description 'Check systemd user space services status'
if test "$argv"
systemctl --user status "$argv"
else
echo "Usage:"
echo "statd <unit.service>"
end
end
