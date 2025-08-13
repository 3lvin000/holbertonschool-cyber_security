#!/bin/bash
# 0-login.sh
# Show the last 5 login sessions with date and time

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or using sudo."
  exit 1
fi

# Display last 5 login sessions
echo "Last 5 login sessions:"
last -n 5
