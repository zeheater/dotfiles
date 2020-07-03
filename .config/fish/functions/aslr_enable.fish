# Defined in /tmp/fish.VDBF87/aslr_enable.fish @ line 2
function aslr_enable --description 'Enable ASLR on kernel'
     sudo bash -c 'echo 2 > /proc/sys/kernel/randomize_va_space'
end
