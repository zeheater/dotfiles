# Defined in - @ line 1
function gef --wraps='/bin/sh /usr/bin/gdb-gef' --description 'alias gef=/bin/sh /usr/bin/gdb-gef'
  /bin/sh /usr/bin/gdb-gef $argv;
end
