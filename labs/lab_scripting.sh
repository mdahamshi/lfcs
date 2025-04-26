#!/bin/bash
# Set permissions on /home/bob/dir8
chmod u=x,g=,o= /home/bob/dir8


# Check if sshd.service is enabled or disabled

STATUS=$(systemctl is-enabled ssh))

if [ "$STATUS" == "enabled" ]; then
    echo "sshd.service is currently ENABLED ✅"
elif [ "$STATUS" == "disabled" ]; then
    echo "sshd.service is currently DISABLED ❌"
else
    echo "sshd.service status: $STATUS"
fi
