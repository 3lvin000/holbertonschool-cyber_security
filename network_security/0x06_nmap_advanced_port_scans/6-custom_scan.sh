#!/bin/bash
sudo nmap -sS -oN --scanflags ALL -p "$2" "{-80-90}" "$1" 
