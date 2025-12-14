# Defined in - @ line 1
function gitdiff --wraps='git diff' --description 'alias gitdiff git diff'
  git diff $argv;
end
