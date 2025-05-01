#!/bin/bash

echo -e "VM Name\t\tUsed Memory (MB)"
echo "-------------------------------------"

for vm in $(virsh list --name); do
    rss_kb=$(virsh dommemstat "$vm" | awk '/^rss/ { print $2 }')
    if [[ -n "$rss_kb" ]]; then
        rss_mb=$((rss_kb / 1024))
        printf "%-16s %10s MB\n" "$vm" "$rss_mb"
    else
        printf "%-16s %10s\n" "$vm" "N/A"
    fi
done

