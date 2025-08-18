#!/bin/bash
subfinder -silent -d $1 | xargs -I{} sh -c "echo -n '{},'; dig +short {} A | head -n1" > "$1.txt"
