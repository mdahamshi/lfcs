cd /home/mohammad/proj/lfcs/docker
docker-compose up -d --build
docker exec -it lfcs-container bash


sudo cp /lib/systemd/system/ssh.service /lib/systemd/system/myapp.service
