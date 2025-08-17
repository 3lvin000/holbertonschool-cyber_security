k#!/bin/bash
[ -z "$1" ] && { >&2 printf "Usage: %s <domain>\n" "$0"; exit 1; }; whois "$1" | awk -F': ' '/Registrant Organization|Admin Organization|Tech Organization|Registrant [^O]|Admin [^O]|Tech [^O]/{gsub(/^[ \t]+|[ \t]+$/, "", $2); if($2 != "") print $1, $2}' > "$1.csv"
