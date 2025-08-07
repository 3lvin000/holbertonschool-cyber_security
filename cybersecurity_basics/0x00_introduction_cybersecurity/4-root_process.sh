#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,cmd | grep -vE '^\s*USER|[[:space:]]0[[:space:]]0$'
