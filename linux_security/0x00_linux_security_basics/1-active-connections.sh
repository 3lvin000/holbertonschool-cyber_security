#!/bin/bash
# Script to display TCP socket connections with process info

# Check if user is root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit 1
fi

# Display TCP sockets: all states, numerical format, with process info
ss -t -a -n -p
