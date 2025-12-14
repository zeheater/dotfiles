# Defined in - @ line 1
function rsync --wraps='rsync --partial --verify-append' --wraps='rsync --partial --append-verify' --description 'alias rsync rsync --partial --append-verify'
 command rsync --partial --append-verify $argv;
end
