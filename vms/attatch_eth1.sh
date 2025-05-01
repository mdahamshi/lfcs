sudo virsh attach-device myubuntu eth1-interface.xml --persistent

sudo virsh dumpxml myubuntu | grep -A 10 '<interface'

sudo virsh attach-device myubuntu veth-vm.xml --persistent


sudo ip link add veth0 type veth peer name veth1
sudo ip link set veth0 up
sudo ip link set veth1 up
