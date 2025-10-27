#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <hash_file>" >&2
  exit 1
fi

HASH_FILE="$1"
if [[ ! -f "$HASH_FILE" ]]; then
  echo "Error: '$HASH_FILE' not found." >&2
  exit 1
fi

WORDLIST="/usr/share/wordlists/rockyou.txt"

if [[ ! -f "$WORDLIST" ]]; then
  if [[ -f "${WORDLIST}.gz" ]]; then
    echo "Decompressing rockyou.txt.gz..."
    gzip -dk "${WORDLIST}.gz"
  else
    echo "Error: Wordlist not found at $WORDLIST" >&2
    echo "Install on Debian/Ubuntu: sudo apt update && sudo apt install john wordlists" >&2
    exit 1
  fi
fi

john --format=Raw-SHA256 --wordlist="$WORDLIST" "$HASH_FILE"

john --show --format=Raw-SHA256 "$HASH_FILE"

john --show --format=Raw-SHA256 "$HASH_FILE" \
  | awk -F: 'NF>=2 {print $2}' \
  | sed '/^$/d' \
  > 4-password.txt

echo "Saved cracked passwords to 4-password.txt"
