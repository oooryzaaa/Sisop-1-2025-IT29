#!/bin/bash

clear

# Parsing command line argument
TRACK=""
for arg in "$@"; do
    if [[ "$arg" == --play=* ]]; then
        TRACK="${arg#*=}"
    fi
done

# Fungsi untuk 'Speak to Me'
speak_to_me() {
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev/ | jq -r '.affirmation')
        echo "$affirmation"
        sleep 1
        
    done
}

# Fungsi untuk 'On the Run'
on_the_run() {
    while true; do
        progress=0
        while [ $progress -le 100 ]; do
            cols=$(tput cols)
            bar_width=$((cols - 7))
            filled=$(( (progress * bar_width) / 100 ))
            unfilled=$(( bar_width - filled ))
            printf "["
            printf "%${filled}s" | tr ' ' '='
            printf "%${unfilled}s" | tr ' ' ' '
            printf "] %3d%%" "$progress"
            sleep_time=$(awk -v min=0.1 -v max=1.0 'BEGIN{srand(); print min+rand()*(max-min)}')
            sleep "$sleep_time"
            printf "\r"
            progress=$((progress + 1))
        done
    done
}

# Fungsi untuk 'Time'
time_func() {
    while true; do
        printf "\r%s" "$(date +'%Y-%m-%d %H:%M:%S')"
        sleep 1
    done
}

# Fungsi untuk 'Money'
money_func() {
    symbols=('$' '€' '£' '¥' '¢' '₹' '₩' '₿' '₣' '¤')
    echo -ne "\e[32m"  # Warna hijau
    echo -ne "\e[?25l"  # Sembunyikan kursor
    trap 'echo -ne "\e[0m\e[?25h"; clear' EXIT
    cols=$(tput cols)
    lines=$(tput lines)
    declare -A matrix
    for ((i=1; i<=lines; i++)); do
        for ((j=1; j<=cols; j++)); do
            matrix[$i,$j]=" "
        done
    done
    while true; do
        # Generate new drops
        for ((j=1; j<=cols; j++)); do
            if (( RANDOM % 50 == 0 )); then
                matrix[1,$j]=${symbols[$((RANDOM % ${#symbols[@]}))]}
            fi
        done
        # Geser semua baris ke bawah
        for ((i=lines; i>1; i--)); do
            for ((j=1; j<=cols; j++)); do
                matrix[$i,$j]=${matrix[$((i-1)),$j]}
            done
        done
        # Bersihkan baris atas
        for ((j=1; j<=cols; j++)); do
            matrix[1,$j]=" "
        done
        # Tampilkan matrix
        clear
        for ((i=1; i<=lines; i++)); do
            line=""
            for ((j=1; j<=cols; j++)); do
                line+=${matrix[$i,$j]}
            done
            echo "$line"
        done
        sleep 0.1
    done
}

# Fungsi untuk 'Brain Damage'
brain_damage() {
    top -b -d 1
}

# Memilih fungsi berdasarkan track
case "$TRACK" in
    "Speak to Me")
        speak_to_me
        ;;
    "On the Run")
        on_the_run
        ;;
    "Time")
        time_func
        ;;
    "Money")
        money_func
        ;;
    "Brain Damage")
        brain_damage
        ;;
    *)
        echo "Track tidak valid: $TRACK"
        echo "Pilihan track: 'Speak to Me', 'On the Run', 'Time', 'Money', 'Brain Damage'"
        exit 1
        ;;
esac
