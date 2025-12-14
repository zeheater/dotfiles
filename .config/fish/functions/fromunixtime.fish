function fromunixtime --wraps='date -d @' --description 'alias fromunixtime date -d @'
  date -d @$argv[1] '+%Y-%m-%d %H:%M:%S'
end
