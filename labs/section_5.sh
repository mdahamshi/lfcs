ip -c addr

sudo ip link set dev enp1s0 up

sudo ip addr add 10.0.2.16/24 dev enp1s0 
sudo ip addr del 10.0.2.16/24 dev enp1s0

netplan try --timeout 10
 sudo vi /etc/systemd/resolved.conf 
sudo systemctl restart systemd-resolved

resolvectl dns

sudo vi /etc/hosts # edit hosts file

ls /usr/share/doc/netplan/examples/ # show examples

sudo ss -ltunp
sudo netstat -ltunp

sudo ufw allow 22

sudo ufw enable
sudo ufw status verbose

 sudo ufw allow from 10.0.0.192 to any port 22

sudo ufw status  numbered

sudo ufw delete 1

sudo ufw delete allow 22


 sudo ufw allow from 10.0.0.0/24 to any port 22 

sudo ufw allow from 10.0.0.0/24  # allow subnet

sudo ufw deny from 10.0.0.37

sudo ufw insert 1 deny from 10.0.0.37

sudo ufw deny out on enp0s3 to 8.8.8.8

sudo ufw allow in on enp1s0 from 10.0.0.192 to 10.0.0.100 proto tcp


 sudo ufw insert 1 deny in from 10.0.0.19

 

sudo sysctl --system

sudo vi /etc/nginx/sites-available/proxy.conf

sudo nginx -t # test nginx config

sudo vi /etc/nginx/sites-available/lb.conf

sudo systemctl reload nginx

timedatectl list-timezones

sudo vi /etc/systemd/timesyncd.conf 

timedatectl show-timesync
timedatectl timesync-status 

sudo vi /etc/ssh/sshd_config

ssh-copy-id bob@10.0.0.2

