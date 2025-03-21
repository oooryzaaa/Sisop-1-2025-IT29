#!/bin/bash

show_main_menu() {
    clear
    echo "╔═════════════════════════════════╗"
    echo "║       !!Arcaea Terminal!!       ║"
    echo "╠═════════════════════════════════╣"
    echo "║ 1. Registrasi Akun Terbaru      ║"
    echo "║ 2. Login                        ║"
    echo "║ 3. Keluar                       ║"
    echo "╚═════════════════════════════════╝"
}

show_logged_in_menu() {
    clear
    echo "╔═════════════════════════════════╗"
    echo "║       !!Arcaea Terminal!!       ║"
    echo "╠═════════════════════════════════╣"
    echo "║ 1. Crontab Manager              ║"
    echo "║ 2. Logout                       ║"
    echo "╚═════════════════════════════════╝"
}

while true; do
    show_main_menu
    read -p "Pilih menu (1-3): " choice

    case $choice in
        1)
            echo "Registrasi Akunmu"
            ./register.sh
            read -p "Enter untuk kembali"
            ;;
        2)
            echo "Login akunmu"
            ./login.sh
            if [[ $? -eq 0 ]]; then
                echo "Login berhasil!"
                while true; do
                    show_logged_in_menu
                    read -p "Pilih menu (1-2): " logged_in_choice

                    case $logged_in_choice in
                        1)
                            echo "Memasuki Crontab Manager"
                            ./manager.sh
                            read -p "Enter untuk kembali"
                            ;;
                        2)
                            echo "Logout berhasil!"
                            break
                            ;;
                        *)
                            echo "Pilihan tidak valid! Coba lagi."
                            sleep 1
                            ;;
                    esac
                done
            else
                echo "Login gagal! Silakan coba lagi."
                read -p "Enter untuk kembali"
            fi
            ;;
        3)
            echo "Keluar dari Arcaea Terminal!"
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid! Silakan pilih 1-3."
            sleep 1
            ;;
    esac
done
