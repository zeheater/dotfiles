define init-peda
source /usr/share/peda/peda.py
end
document init-peda
Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
source /usr/share/pwndbg/gdbinit.py
set syntax-highlight-style solarized-dark
set context-code-lines 15
set nearpc-lines 15
end
document init-pwndbg
Initializes PwnDBG
end

define init-gef
source ~/.gdbinit-gef.py
end
document init-gef
Initializes GEF (GDB Enhanced Features)
end

define init-vanila
source ~/.gdbinit-noplug
end
document init-vanila
Using not so vanila gdb
end

define init-voltron
source ~/.local/lib/python3.8/site-packages/voltron/entry.py
end
document init-voltron
Initialize Voltron debugger UI
end
