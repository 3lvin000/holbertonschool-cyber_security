#!/bin/bash
# Allow only incoming TCP connections on port 80

# Allow TCP port 80
sudo ufw allow 80/tcp
echo "Rules updated"

# Allow same rule for IPv6
sudo ufw allow proto tcp from any to any port 80
echo "Rules updated (v6)"
