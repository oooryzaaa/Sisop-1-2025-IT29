#!/bin/bash

cpu_usage() {
    cpu_usage=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | 
        awk -v RS="" '{printf "%.2f", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')

    if [[ -z "$cpu_usage" || "$cpu_usage" == "0.00" ]]; then
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    fi

    echo "$cpu_usage"
}

cpu_usage=$(cpu_usage)

cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d ":" -f2 | xargs)

log_file="logs/core.log"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] - Core Usage [$cpu_usage%] - Terminal Model [$cpu_model]" >> "$log_file"


echo      CPU Model  : $cpu_model          
echo      CPU Usage  : $cpu_usage%         
