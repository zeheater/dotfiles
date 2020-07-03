function psgrep --description 'List running process filter by grep'
     isatty stdout
     if test "$argv"
          ps ux | grep "$argv"
     else
          ps "$argv"
     end
end
