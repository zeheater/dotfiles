function targz --description 'Tarball and gzip target folder to destination with visual progress'
    if test (count $argv) -eq 2
        #tar -cf - $argv[1] | pv -s (du -sb $argv[1] | awk '{print $1}') | gzip > "$argv[2]"
        pv -teprb "$argv[1]" | gzip > "$argv[2]"
    else
        echo 'Usage: targz <target> <destination>'
    end
end
