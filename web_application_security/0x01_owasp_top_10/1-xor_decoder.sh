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
base64_string="${encoded_string#$prefix}"


# Decode the clean Base64 string and pipe it to Perl for a robust byte-wise XOR operation.
# The perl one-liner correctly handles all characters, including null bytes, without causing warnings.
decoded_string=$(echo -n "$base64_string" | base64 -d | perl -pe '$_ ^= "_" x length')

# Print the final decoded string
echo "$decoded_string"
