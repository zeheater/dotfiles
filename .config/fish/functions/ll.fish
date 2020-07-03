# Defined in /tmp/fish.lcsCHY/ll.fish @ line 2
function ll --description 'List contents of directory using long format'
     isatty stdout
     ls --color=auto -lAh --time-style long-iso $argv
end
