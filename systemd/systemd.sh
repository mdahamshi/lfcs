cd /home/mohammad/proj/lfcs/docker
docker-compose up -d --build
docker exec -it lfcs-container bash


sudo cp /lib/systemd/system/ssh.service /lib/systemd/system/myapp.service

sudo systemctl daemon-reload
sudo systemctl start myapp.service
sudo systemctl status myapp.service

# show pid of sshd
systemctl show sshd --property=MainPID --value > /home/bob/pid

# check if sshd is enabled
systemctl is-enabled sshd
# check if sshd is active
systemctl is-active sshd
# check if sshd is running
systemctl is-running sshd

sudo systemctl mask apache2.service
sudo systemctl unmask apache2.service