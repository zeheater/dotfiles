# Defined in - @ line 1
function gefupdate --wraps='wget -O .gdbinit-gef.py -q https://tinyurl.com/gef-master' --description 'alias gefupdate=wget -O .gdbinit-gef.py -q https://tinyurl.com/gef-master'
  wget -O .gdbinit-gef.py -q https://tinyurl.com/gef-master $argv;
end
