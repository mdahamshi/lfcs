sudo adduser bob
sudo passwd bob
sudo deluser bob
sudo deluser --remove-home bob
ls -ln # list files with numeric user and group IDs

sudo adduser --system --no-create-home mysysacc

sudo adduser john
sudo usermod --home /home/jj --move-home john

sudo usermod -d /home/jj -m john
sudo usermod --login jane john 
sudo usermod -l jane john
sudo usermod --shell /bin/bash john # -l = --login
sudo usermod --lock john # = -L
sudo usermod --unlock john # = -U
sudo usermod --expiredate 2023-10-01 john # = -e
sudo usermod --expiredate "" john # = -e
sudo chage --lastday 0 john # expire password  -d == --lastday
sudo chage --lastday -1 john # unexpire password
sudo chage --maxdays 90 john # max days to change password  -M == --maxdays
sudo chage --maxdays -1 john #  password doesn 't expire  -M == --maxdays
sudo chage --list john # show password info  -l == --list


sudo groupadd developers
sudo gpasswd --add john developers  # add user to group  -a == --add
sudo groupdel john
groups john # show groups for user
sudo gpasswd --delete john developers # remove user from group  -d == --delete
sudo usermod --gid developers john # change group for user  -g == --gid
sudo groupdmod --new-name programers developers # change group name  -n == --new-name
sudo groupdel programers


printenv # show environment variables == env

sudo vi /etc/environment # edit environment variables
sudo vi /etc/profile.d/lastloginsh # script that run everytime user login

sudo vi /etc/skel/README.txt # file that copied to new user home directory
sudo vi /etc/security/limits.conf # file that set limits for users
man limits.conf
ulimit -a # show limits for user
ulimit -u 2000 # set max user processesG

sudo gpasswd -a trinity sudo # add user to group sudo
sudo visudo
sudo EDITOR=vi visudo 

trinity ALL=(ALL) NOPASSWD: ALL # allow user to run all commands without password
su - | su -l  | su --login

sudo passwd root
sudo passwd --unlock root # unlock root account
sudo passwd --lock root # lock root account
sudo passwd -S root # show password status



make ldap server:
lxc launch images:ubuntu/22.04 ldap-server
lxc exec ldap-server -- bash
apt update
apt install slapd ldap-utils -y
dpkg-reconfigure slapd
lxc config device add ldap-server ldap-port proxy listen=tcp:0.0.0.0:389 connect=tcp:127.0.0.1:389

sudo apt install libnss-ldapd -y
/etc/nsswitch.conf: enable LDAP lookups for group                              
/etc/nsswitch.conf: enable LDAP lookups for passwd
/etc/nsswitch.conf: enable LDAP lookups for shadow


cat /etc/nslcd.conf 

ldapsearch -x -LLL -H ldap://localhost -b "dc=example,dc=com"

getent passwd
getent group





