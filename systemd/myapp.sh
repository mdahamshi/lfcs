#!/bin/sh
echo "Starting MyApp service..." | systemd-cat -t myapp -p info
# Simulate some work
sleep 5
echo "MyApp service started successfully." | systemd-cat -t myapp -p info
# error occured
echo "An error occurred in MyApp service." | systemd-cat -t myapp -p err