#!/bin/bash
whois $1 | awk -F': ' '
/^Registrant Organization/ || /^Registrant State/ || /^Registrant Country/ || /^Registrant Email/ ||
/^Admin Organization/ || /^Admin State/ || /^Admin Country/ || /^Admin Email/ ||
/^Tech Organization/ || /^Tech State/ || /^Tech Country/ || /^Tech Email/ {print $1 "," $2}' > "$1.csv"
