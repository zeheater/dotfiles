# Defined in /tmp/fish.mThMoh/aslr_disable.fish @ line 2
function aslr_disable --wraps='sudo echo 0 > /proc/sys/kernel/randomize_va_space' --wraps='sudo echo 0> sudo echo 0 > /proc/sys/kernel/randomize_va_space' --description 'Disable ASLR on kernel'
     sudo bash -c 'echo 0 > /proc/sys/kernel/randomize_va_space'
end
