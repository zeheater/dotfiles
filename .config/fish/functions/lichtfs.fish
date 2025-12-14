function lichtfs --wraps='sshfs root@lichtschein.id:/var/www/ /home/zeheater/mnt/sshfs/' --description 'alias lichtfs sshfs root@lichtschein.id:/var/www/ /home/zeheater/mnt/sshfs/'
  sshfs root@lichtschein.id:/var/www/ /home/zeheater/mnt/sshfs/ $argv; 
end
