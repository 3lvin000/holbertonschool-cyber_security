k#!/usr/bin/env bash
sudo nmap -sS --scanflags ALL -p "${2:-80-90}" "$1" > custom_scan.txt 2>&1
