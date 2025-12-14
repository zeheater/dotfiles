function restard
if test "$argv"
systemctl --user restart "$argv"
else
echo 'Usage:'
echo 'restartd <unit.service>'
end
end
