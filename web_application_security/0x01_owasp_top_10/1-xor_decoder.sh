#!/bin/bash
# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <encoded_string>"
  exit 1
fi

# Decode the Base64 input and then XOR it with the key '_'
# -d: decode mode for base64
# tr: translate characters. Here it performs the XOR operation with '_'
decoded_string=$(echo -n "$1" | base64 -d | tr '_' '\0' | tr '\377' '_')

# Print the final decoded string
echo "$decoded_string"
