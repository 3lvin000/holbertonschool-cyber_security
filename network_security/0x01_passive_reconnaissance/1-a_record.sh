#!/usr/bin/env bash
domain="$1"

if [ -z "$domain" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi
