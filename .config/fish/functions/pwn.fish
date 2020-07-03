# Defined in - @ line 1
function pwn --wraps=gdb-pwngdb --wraps='/bin/sh gdb-pwngdb' --wraps='/bin/sh /usr/bin/gdb-pwngdb' --wraps='/bin/sh /usr/bin/gdb-pwndbg' --description 'alias pwn=/bin/sh /usr/bin/gdb-pwndbg'
  /bin/sh /usr/bin/gdb-pwndbg $argv;
end
