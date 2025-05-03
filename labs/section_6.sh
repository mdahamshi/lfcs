lsblk

sudo mkswp /dev/sdb1
sudo swapon --verbose /dev/sdb1
sudo swapoff --verbose /dev/sdb1
sudo dd if=/dev/zero of=/swap bs=1M count=128 status=progress
sudo mkswap /swap
sudo swapon --verbose /swap

sudo swapon --show 



  sudo mkfs.xfs /dev/vdb2
  sudo xfs_admin -l /dev/vdb2
  sudo xfs_admin -L swap /dev/vdb2
  sudo mkfs.ext4 /dev/vdb2
  sudo mkfs.ext4 -N 500000 /dev/vdb2
  sudo tune2fs -l /dev/vdb2 | grep 'Filesystem features'
  mkdir /bkp
  sudo mount /dev/vdb2 /bkp
  sudo vi /etc/fstab

findmnt

findmnt -t xfs,ext4
sudo mount -o ro /dev/vdb2 /bkp
sudo mount -o remount,rw,noexec,nosuid /dev/vdb2 /bkp

sudo apt install nfs-kernel-server
sudo vi /etc/exports

sudo lvmdiskscan

sudo pvcreate /dev/vdb /dev/vdc
sudo pvs
vgcreate myvol /dev/vdb /dev/vdc
sudo pvcreate /dev/vdd
sudo vgextend myvol /dev/vdd
sudo vgreduce myvol /dev/vdd
sudo pvremove /dev/vdd
sudo lvcreate --size 2G --name par1 myvol

sudo lvcreate --size 6G --name par2 myvol
sudo lvs

sudo lvresize --extents 100%VG myvol/par1
sudo lvresize --size 2G myvol/par1
sudo mkfs.ext4 /dev/myvol/par1

sudo lvresize --resizefs --size 3G myvol/par1

sudo apt install sysstat
iostat
iostat 1
dd if=/dev/zero of=DEL bs=1 count=100000 oflag=dsync 
pidstat -d
pidstat -d 1
sudo dmsetup info /dev/dm-0
iostat -p ALL
iostat -p vda
sudo setfacl --modify mask:r file3

sudo setfacl --remove-all file3

sudo setfacl --recursive -m user:mohammad:rwx dir1/

sudo chattr +a newfile  # append only
sudo chattr -a newfile 
sudo chattr +i newfile  # immutable
lsattr newfile




