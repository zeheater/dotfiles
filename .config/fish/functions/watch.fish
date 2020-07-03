# Defined in /tmp/fish.bgkGb2/watch.fish @ line 2
function watch
     isatty stdout
     command watch --color $argv
end
