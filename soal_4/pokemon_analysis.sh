#!/bin/bash
show_help() {
    echo " ___     _     _                     _ "
    echo "|  _  |_| |_| |_ _ _ _ _| |"
    echo "|   _| . | | . | | . |  _| -|_ -| -_| |"
    echo "|_|  |_||  ||_|| |_|_|_||"
    echo "            |_|                          "
    echo "=========================================="
    echo "Pokemon Generation 9 OverUsed Meta Analysis Tool"
    echo ""
    echo "Usage: ./pokemon_analysis.sh <file.csv> [options]"
    echo ""
    echo "Options:"
    echo "  --info                 Show meta summary"
    echo "  --sort <criteria>      Sort by: usage, raw, name, hp, atk, def, spatk, spdef, speed"
    echo "  --grep <name>          Search Pokemon by exact name"
    echo "  --filter <type>        Filter by Pokemon type"
    echo "  -h, --help             Show this help screen"
    echo ""
    echo "Examples:"
    echo "  ./pokemon_analysis.sh pokemon_usage.csv --info"
    echo "  ./pokemon_analysis.sh pokemon_usage.csv --sort atk"
    echo "  ./pokemon_analysis.sh pokemon_usage.csv --grep Rotom-Wash"
    echo "  ./pokemon_analysis.sh pokemon_usage.csv --filter Dark"
    exit 0
}


handle_error() {
    case $1 in
        no_file) echo "Error: File '$2' not found"; exit 1;;
        no_args) echo "Error: Missing arguments"; exit 1;;
        invalid_cmd) echo "Error: Unknown command '$2'"; exit 1;;
        filter) echo "Error: No filter option provided"; exit 1;;
        sort) echo "Error: Invalid sort criteria '$2'"; exit 1;;
        grep) echo "Error: Missing search pattern"; exit 1;;
    esac
}

# Fungsi utama untuk summary
show_summary() {
    awk -F, 'NR > 1 {
        if ($2 + 0 > max_usage + 0) {
            max_usage = $2
            pokemon_usage = $1
        }
        if ($3 + 0 > max_raw + 0) {
            max_raw = $3
            pokemon_raw = $1
        }
    } END {
        printf "Summary of %s\n", ARGV[1]
        printf "Highest Adjusted Usage: %s with %.4f%%\n", pokemon_usage, max_usage
        printf "Highest Raw Usage: %s with %d uses\n", pokemon_raw, max_raw
    }' "$1"
}

# Fungsi sorting
sort_data() {
    file=$1
    criteria=$2
    
    declare -A sort_options=(
        [usage]="-t, -k2,2nr"
        [raw]="-t, -k3,3nr"
        [name]="-t, -k1,1"
        [hp]="-t, -k6,6nr"
        [atk]="-t, -k7,7nr"
        [def]="-t, -k8,8nr"
        [spatk]="-t, -k9,9nr"
        [spdef]="-t, -k10,10nr"
        [speed]="-t, -k11,11nr"
    )
    
    if [[ -z ${sort_options[$criteria]} ]]; then
        handle_error "sort" "$criteria"
    fi
    
    # Header + sorted data
    head -1 $file
    tail -n +2 $file | sort ${sort_options[$criteria]} -o sorted.csv
    cat sorted.csv
    rm sorted.csv
}

# Fungsi search
grep_pokemon() {
    awk -F, -v name="$2" 'NR == 1 || tolower($1) ~ tolower(name)' "$1" | sort -t, -k2,2nr
}

# Fungsi filter type
filter_type() {
    awk -F, -v type="$2" 'NR == 1 || tolower($4) == tolower(type) || tolower($5) == tolower(type)' "$1" | sort -t, -k2,2nr
}

main() {

    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        show_help
    fi


    if [[ $# -lt 2 ]]; then
        handle_error "no_args"
    fi

    file=$1
    if [[ ! -f $file ]]; then
        handle_error "no_file" "$file"
    fi

    shift
    case $1 in
        --info)
            show_info "$file"
            ;;
        --sort)
            shift
            if [[ $# -lt 1 ]]; then
                handle_error "sort" "missing criteria"
            fi
            sort_data "$file" "$1"
            ;;
        --grep)
            shift
            if [[ $# -lt 1 ]]; then
                handle_error "grep"
            fi
            search_pokemon "$file" "$1"
            ;;
        --filter)
            shift
            if [[ $# -lt 1 ]]; then
                handle_error "filter"
            fi
            filter_type "$file" "$1"
            ;;
        *)
            handle_error "invalid_cmd" "$1"
            ;;
    esac
}


main "$@"
