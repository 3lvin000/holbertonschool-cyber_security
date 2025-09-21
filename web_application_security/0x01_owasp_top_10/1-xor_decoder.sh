#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <encoded_string>"
  exit 1
fi

# Define the prefix to be removed
prefix="{xor}"
encoded_string=$1

# Remove the prefix from the beginning of the string
# ${variable#prefix} syntax removes the 'prefix' from the start of 'variable'
base64_string="${encoded_string#$prefix}"


# Decode the clean Base64 string and then XOR it with the key '_'
# -d: decode mode for base64
# tr: translate characters. Here it performs the XOR operation with '_'
decoded_string=$(echo -n "$base64_string" | base64 -d | tr '_' '\0' | tr '\377' '_')

# Print the final decoded string
echo "$decoded_string"
