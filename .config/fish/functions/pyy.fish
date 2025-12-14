function pyy --description 'alias pyany=source /home/zeheater/Sandbox/pythonbox/anything/bin/activate.fish'
  pushd /home/zeheater/Sandbox/pythonbox/anything; source /home/zeheater/Sandbox/pythonbox/anything/bin/activate.fish $argv;
  while true
      read -P 'Retain current working directory ? [y/N] ' -l confirm
      switch $confirm
        case Y y
          popd
          break
        case '' N n
          break
      end
  end
end
