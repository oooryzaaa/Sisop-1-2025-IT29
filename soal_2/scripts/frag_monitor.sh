#!/bin/bash

ram_usage() {
    total_ram_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    available_ram_kb=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

    total_ram_mb=$((total_ram_kb / 1024))
    available_ram_mb=$((available_ram_kb / 1024))

    used_ram_mb=$((total_ram_mb - available_ram_mb))

    ram_usage=$(echo "scale=2; $used_ram_mb * 100 / $total_ram_mb" | bc)

    echo "$ram_usage,$used_ram_mb,$total_ram_mb,$available_ram_mb"
}

ram_data=$(ram_usage)
ram_usage=$(echo "$ram_data" | cut -d ',' -f 1)
used_ram_mb=$(echo "$ram_data" | cut -d ',' -f 2)
total_ram_mb=$(echo "$ram_data" | cut -d ',' -f 3)
available_ram_mb=$(echo "$ram_data" | cut -d ',' -f 4)

echo "[$(date '+%Y-%m-%d %H:%M:%S')] - Fragment Usage [$ram_usage%] - Fragment Count [$used_ram_mb MB] - Details [Total: $total_ram_mb MB, Available: $available_ram_mb MB]" >> "$log_file"

echo "Fragment Usage: $ram_usage%"
echo "Fragment Count: $used_ram_mb MB"
echo "Total RAM: $total_ram_mb MB"
echo "Ketersediaan RAM: $available_ram_mb MB"
