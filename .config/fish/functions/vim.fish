# Defined in - @ line 1
function vim --wraps=nvim --wraps=/usr/bin/nvim --description 'alias vim=/usr/bin/nvim'
  /usr/bin/nvim  $argv;
end
