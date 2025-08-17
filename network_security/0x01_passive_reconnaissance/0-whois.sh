k#!/bin/bash
[ -z "$1" ] && { >&2 printf "Usage: %s <domain>\n" "$0"; exit 1; }; whois "$1" | awk -F': ' 'BEGIN{OFS=","} /Registrant (Organization|State\/Province|Country|Email)|Admin (Organization|State\/Province|Country|Email)|Tech (Organization|State\/Province|Country|Email)/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); if($2 != "") print $1, $2}' > "$1.csv"
