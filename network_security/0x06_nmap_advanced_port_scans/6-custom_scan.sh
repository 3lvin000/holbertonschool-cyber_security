#!/bin/bash
sudo nmap -sS --scanflags ALL -p "$2" "{-80-90}" "$1" 
