function timezone --description 'Get local timezone settings'
timedatectl | grep 'Time zone:' | awk '{print $3}'
end
