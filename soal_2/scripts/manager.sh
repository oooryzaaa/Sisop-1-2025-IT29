#!/bin/bash

CPU_MONITOR="core_monitor.sh"
RAM_MONITOR="fragment_monitor.sh"

SCRIPT_DIR="$(dirname "$0")"
CPU_MONITOR_PATH="$SCRIPT_DIR/$CPU_MONITOR"
RAM_MONITOR_PATH="$SCRIPT_DIR/$RAM_MONITOR"

add_cron() {
    local task="$1"
    local interval="$2"
    local log_file="$3"
    local schedule="*/$interval * * * * $task >> $log_file 2>&1"
    (crontab -l; echo "$schedule") | crontab -
    echo "Job added to crontab with interval $interval minutes! Logs will be saved to $log_file."
}

remove_cron() {
    local task="$1"
    crontab -l | grep -v "$task" | crontab -
    echo "Job removed from crontab!"
}

view_jobs() {
    crontab -l
}

read_option() {
    while true; do
        read -p "Enter option [1-6]: " option
        if [[ "$option" =~ ^[1-6]$ ]]; then
            break
        else
            echo "Invalid option! Please enter a number between 1 and 6."
        fi
    done
}

read_interval() {
    while true; do
        read -p "Enter interval (in minutes): " interval
        if [[ "$interval" =~ ^[0-9]+$ ]]; then
            break
        else
            echo "Invalid interval! Please enter a number."
        fi
    done
}

while true; do
    clear
    echo "╔═════════════════════════════════╗"
    echo "║         CRONTAB MANAGER         ║"
    echo "╠═════════════════════════════════╣"
    echo "║ ID │ OPTION                     ║"
    echo "╠═════════════════════════════════╣"
    echo "║ 1  │ Add CPU – Core Monitor     ║"
    echo "║ 2  │ Add RAM – Fragment Monitor ║"
    echo "║ 3  │ Remove CPU – Core Monitor  ║"
    echo "║ 4  │ Remove RAM – Fragment Mon. ║"
    echo "║ 5  │ View Scheduled Jobs        ║"
    echo "║ 6  │ Exit Crontab Manager       ║"
    echo "╚═════════════════════════════════╝"
    read_option

    case $option in
        1) 
            read_interval
            add_cron "$CPU_MONITOR_PATH" "$interval" "$SCRIPT_DIR/logs/core.log" ;;
        2) 
            read_interval
            add_cron "$RAM_MONITOR_PATH" "$interval" "$SCRIPT_DIR/logs/fragment.log" ;;
        3) remove_cron "$CPU_MONITOR_PATH" ;;
        4) remove_cron "$RAM_MONITOR_PATH" ;;
        5) view_jobs ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option!" ;;
    esac

    echo -n "Press Enter to continue..."
    read
done
