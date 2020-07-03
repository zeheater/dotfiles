function create_qemu_image
command echo '# qemu-img create <file.img> <size>'
command echo '# mkfs.ext4 <file.img>'
command echo '# mount -t loop <mount point> <file.img>'
end
