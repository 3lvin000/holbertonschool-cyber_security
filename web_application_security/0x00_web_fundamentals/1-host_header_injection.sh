#!/bin/bash
curl -x -s -H "Host: $1" -d "$3" "$2"
