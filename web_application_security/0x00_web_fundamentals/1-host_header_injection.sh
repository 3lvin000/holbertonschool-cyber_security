#!/bin/bash
curl -X -s -H "Host: $1" -d "$3" "$2"
