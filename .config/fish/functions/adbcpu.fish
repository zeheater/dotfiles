# Defined in - @ line 1
function adbcpu --wraps='adb shell getprop ro.product.cpu.abi' --description 'alias adbcpu=adb shell getprop ro.product.cpu.abi'
  adb shell getprop ro.product.cpu.abi $argv;
end
