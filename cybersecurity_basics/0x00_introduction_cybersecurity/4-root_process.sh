#!/bin/bash
ps aux | grep -E "^$1[[:space:]]" | grep -v 'VSZ' | grep -vE '[[:space:]]0[[:space:]]0[[:space:]]'
