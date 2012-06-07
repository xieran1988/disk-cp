
a := /dev/sdb
b := /dev/sdd

save:
	mount ${a}1 a
	cd a && tar -cf ../a.tar *

get-uuid:
	cat a/boot/grub/grub.cfg | awk '/uuid/{print $$NF; exit}' > uuid

clone:
	dd if=mbr of=${b}
	sfdisk -f ${b} < sdb.table.500
	partprobe
	mkfs.ext4 -U `cat uuid` ${b}1
	mount ${b}1 b
	tar -xf a.tar -C b
	umount b

