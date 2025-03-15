#!/bin/bash
clear
# Parse argument
TRACK=""
for arg in "$@"; do
    if [[ "$arg" == "--play="* ]]; then
        TRACK="${arg#*=}"
        TRACK="${TRACK//[\"\'/}"
        break
    fi
done

# Fungsi-fungsi utama
speak_to_me() {
    while true; do
        curl -s "https://www.affirmations.dev" | jq -r '.affirmation'
        sleep 1
    done
}

on_the_run() {
    cols=$(($(tput cols) - 7))  
    for i in {1..100}; do
        filled=$((i * cols / 100))
        printf "\r[%-${cols}s] %3d%%" "$(printf '%*s' $filled | tr ' ' '=')" "$i"
        sleep "0.$((RANDOM%9+1))"  
    done
    echo
}

time_func() {
    while true; do
        printf "\r%s" "$(date +'%Y-%m-%d %H:%M:%S')"
        sleep 1
    done
}



money() {
    chars=('$' '€' '£' '¥' '¢' '₹' '₩' '₿' '₣')
    while true; do
        cols=$(tput cols)
        rows=$(tput lines)
        col=$((RANDOM % cols))
        row=$((RANDOM % rows))
        tput cup $row $col
        echo -ne "\e[1;32m${chars[$RANDOM % 9]}\e[0m"
        sleep 0.05   
done
}

brain_damage() {
    top -b -d 1
}

case "$TRACK" in
    "Speak to Me")  speak_to_me ;;
    "On the Run")   on_the_run ;;
    "Time")         time_func ;;
    "Money")        money ;;
    "Brain Damage") brain_damage ;;
    *)
        echo -e "Usage: ./dsotm.sh --play=\"Track Name\""
        echo -e "Tracks Available: "
        echo "• Speak to Me"
        echo "• On the Run"
        echo "• Time"
        echo "• Money"
        echo "• Brain Damage"
        ;;
esac
