function ssh --wraps='TERM=linux /usr/bin/ssh' --description 'alias ssh TERM=linux kitty +kitten ssh'
  TERM=linux kitty +kitten ssh $argv
end
