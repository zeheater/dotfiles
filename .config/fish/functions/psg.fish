# Defined in /tmp/fish.nSS2Aq/psg.fish @ line 2
function psg --description 'List running process filter by grep'
     isatty stdout
     if test "$argv"
          command ps ux | grep $argv
     else
          command ps $argv
     end
end
