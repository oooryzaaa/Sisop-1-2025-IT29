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

speak_to_me() {
    while true; do
        curl -s "https://www.affirmations.dev" | jq -r '.affirmation'
        sleep 1
    done
}

on_the_run() {
    
    cols=$(($(tput cols) - 10))
    echo
    
    for i in {1..100}; do
        filled=$((i * cols / 100))
        printf "\r\e[36m[\e[0m%-${cols}s\e[36m]\e[35m %3d%%\e[0m" \
               "$(printf '%*s' $filled | tr ' ' '=')" "$i"
        sleep "0.$((RANDOM%9+1))"
    done
    echo
}

time_func() {
    tput civis
    trap 'tput cnorm' EXIT
    
    while true; do
        
        cols=$(tput cols)
        rows=$(tput lines)
        
        
        time_str=$(date +'%H:%M:%S')
        date_str=$(date +'%Y-%m-%d')
        combined="${date_str} ${time_str}"
        
       
        half_width=$(( (${#combined} + 2) / 2 ))
        pos_x=$(( (cols / 2) - half_width + 1 ))
        pos_y=$(( rows / 2 ))
        
        
        border=$(printf '═%.0s' $(seq 1 $((${#combined} + 2))))
        
        
        tput cup $((pos_y - 1)) $((pos_x - 1))
        echo -ne "\e[1;36m╔${border}╗\e[0m"
        
        tput cup $pos_y $((pos_x - 1))
        echo -ne "\e[36m║ \e[1;33m${date_str} \e[35m${time_str} \e[36m║\e[0m"
        
        tput cup $((pos_y + 1)) $((pos_x - 1))
        echo -ne "\e[1;36m╚${border}╝\e[0m"
        
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
    trap 'echo -e "\e[35m\n[!] Exiting neural scanner... \e[31m✹\e[0m\n"; exit' SIGINT
    
    
    echo -e "\e[1;31m
    ██████╗ ██████╗  █████╗ ██╗███╗   ██╗     ██████╗  █████╗ ███╗   ███╗ █████╗  ██████╗ ███████╗
    ██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║     ██╔══██╗██╔══██╗████╗ ████║██╔══██╗██╔════╝ ██╔════╝
    ██████╔╝██████╔╝███████║██║██╔██╗ ██║     ██║  ██ ███████║██╔████╔██║███████║██║  ███╗█████╗  
    ██╔══██╗██╔══██╗██╔══██║██║██║╚██╗██║     ██║  ██║██╔══██║██║╚██╔╝██║██╔══██║██║   ██║██╔══╝  
    ██████╔╝██║  ██║██║  ██║██║██║ ╚████║    ╚██████  ██║  ██║██║ ╚═╝ ██║██║  ██║╚██████╔╝███████╗
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝      ╚═══   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
    \e[0m"
    
    
    echo -e "\e[1;36m╭──────────────────────────────────────────────╮\e[0m"
    top -b -d 1 | awk '
    BEGIN {
        RS="\n"
        FS="\n"
        print "\033[36m│ \033[35mPID \tUSER \tCPU% \tMEM% \tCOMMAND\033[36m │"
    }
    NR <= 5 { print "\033[36m│ \033[33m" $0 "\033[36m │"; next }
    NR > 5 {
        cmd = $0
        gsub(/ /, "", cmd)
        if (cmd ~ /[0-9]/) {
            split($0, f, " ")
            printf "\033[36m│ \033[37m%-6s \033[32m%-8s \033[31m%-5s \033[34m%-5s \033[36m%-30s \033[36m│\n", 
            f[1], f[2], f[9], f[10], substr($0, index($0,f[12]))
        }
    }
    END { print "\033[36m╰──────────────────────────────────────────────╯\033[0m" }'
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
