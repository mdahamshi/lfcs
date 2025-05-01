

ps aux

ps u -U mohammad

pgrep -a syslog
ps l # show nice value
nice -n 11 bash
ps lax

ps fax  # show parent process

renice 7 12312

kill -9 12312

pkill -KILL bash

fg 1
bg 1
jobs

pgrep -a bash

lsof -p 12312  # show file used by process

tail -F /var/log/auth.log  # show log file

journalctl /usb/bin/sudo # show logs by sudo
journalctl -p err # show logs err  crit alert debug emerg info notice warning

journalctl -p info -g '^b' # show logs by priority and grep
journalctl -S "2023-10-01 12:00:00" -U "2023-10-01 12:30:00" # show logs by date
journalctl -b -1 # show logs by previeus boot  0 current

last -x # show last logins


crontab -l # show crontab

sudo crontab -r jane # remove crontab for user jane

anacron:

3   10  test job    /bin/test.sh  # run every 3 days with 10 min delay

at 'August 10 12:00' # run at specific time
at -l # show at jobs
 HH:MM YYYY-MM-DD
at 'now + 5 minutes' # run at specific time
at 'now + 3 hours' # run at specific time
atrm 1
atq # show at jobs


dpkg --listfiles nginx # show files installed by nginx
dpkg --sarch /usr/bin/sshd # show package for file
apt show    nginx # show package info
apt search --names-only nginx # search for package with name
apt autoremove # remove unused packages
vi /etc/apt/source.list.d/ubuntu.sources

sudo fsck.ext4 -v -f -p /dev/sda1 # check file system -p fix errors

systemctl list-dependencies


sysctl -w net.ipv4.ip_forward=1 # enable ip forwarding


sysctl -p /etc/sysctl.d/swap-less.conf # load sysctl configls


#stop apparmor
sudo systemctl stop apparmor.service
sudo systemctl disable apparmor.service

sudo apt install selinux-basics auditd
sestatus
sudo selinux-activate
cat /etc/default/grub # check selinux
ls -a  / # .autorelabel tell selinux to relabel
sudo audit2why --all | less # show selinux logs

sudo audit2allow --all -M mypol # create policy

sudo setenforce 1 # set selinux to enforcing
seinfo -r 
seinfo -u 
seinfo -t

sudo semanage boolean --list

sudo setsebool virt_use_nfs 1 # set selinux boolean
getsebool virt_use_nfs # check selinux boolean

sudo semanage port --list

sudo semanage port -a -t ssh_port_t -p  tcp 2222 # add port to selinux
sudo semanage port -d -t ssh_port_t -p  tcp 2222 # remove port from selinux

docker stop lucied
docker ps --all # show all docker containers
nc localhost 8080 # check if port is open

docker run --detach --publish 8080:80  --name myseever nginx

docker rm myserver
docker rmi nginx  # remove image
man docker run
docker run --detach --publish 8080:80 --restart always  --name myseever nginx

docker build --tag mohammad/customnginx:1.0 myimage


virsh define testmachine.xml
virsh list --all
virsh start testmachine
virsh reboot testmachine
virsh undefine testmachine
virsh help undefine
virsh undefine --remove-all-storage testmachine
virsh autostart testmachine
virsh autostart --disable testmachine
virsh dominfo testmachine
virsh setvcpus testmachine 2 --config
virsh setmaxmem testmachine 2048M --config
virsh setmem testmachine 2024M --config


wget https://cloud-images.ubuntu.com/minimal/releases/noble/release/ubuntu-24.04-minimal-cloudimg-amd64.img
wget https://cloud-images.ubuntu.com/minimal/releases/noble/release/SHA256SUMS
wget https://cloud-images.ubuntu.com/minimal/releases/noble/release/SHA256SUMS.gpg
sha256sum -c SHA256SUMS 2>&1 | grep OK

qemu-img info ubuntu-24.04-minimal-cloudimg-amd64.img
qemu-img resize ubuntu-24.04-minimal-cloudimg-amd64.img 10G
sudo cp ubuntu-24.04-minimal-cloudimg-amd64.img /var/lib/libvirt/images/
virt-install --osinfo list
man virt-install
?--import
virt-install --help
virsh console testmachine
virt-install --osinfo ubuntu22.04 --name myubuntu  --memory 1024 --vcpus 1 --import --disk /var/lib/libvirt/images/ubuntu-24.04-minimal-cloudimg-amd64.img --graphics none --cloud-init root-password-generate=on
virt-install --osinfo detect=on --name myubuntu  --memory 1024 --vcpus 1 --import --disk /var/lib/libvirt/images/ubuntu-24.04-minimal-cloudimg-amd64.img --graphics none --cloud-init root-password-generate=on
virt-install --osinfo debian12 --name debian1 --memory 1024 --vcpus 1 --disk size=10 --location https://deb.debian.org/debian/dists/bookworm/main/installer-amd64/ --graphics none  --extra-args "console=ttyS0"

echo "export TERM=xterm-256color" >> ~/.bashrc

