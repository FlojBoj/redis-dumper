#!/bin/bash

ip_address=""
port=""

MAX_DBS=16

for db in $(seq 0 $((MAX_DBS-1))); do
  echo "Switching to database $db"
  redis-cli -h $ip_address -p $port -n $db keys '*' | while read key; do
    echo "Database $db - Key: $key - Value: $(redis-cli -h $ip_address -p $port -n $db get "$key")"
  done
done
