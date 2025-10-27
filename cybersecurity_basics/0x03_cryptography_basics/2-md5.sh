#!/usr/bin/env bash
printf "%s" "$1" | md5sum | cut -d' ' -f1 > 2_hash.txt
