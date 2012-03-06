dev=/dev/sdb
sudo sfdisk -f $dev < sdb.table
sudo partprobe
sudo partclone.ext4 -r -d -s sdb1.img -o ${dev}1

