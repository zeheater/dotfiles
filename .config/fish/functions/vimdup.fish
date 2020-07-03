function vimdup --description 'Read existing file to buffer, to then later save-as'
if test "$argv"
if test "$argv[2]"
nvim -c "read $argv[1]" -c "write $argv[2]"
else
nvim -c "read $argv[1]"
end
end
end
