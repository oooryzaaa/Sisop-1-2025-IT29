#!/bin/bash

file_database="/data/player.csv"
SALT="C4sPL0ck"

echo -n "Masukkan email: "
read email
echo

if [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Email tidak valid! Pastikan format email benar (contoh: user@example.com)."
    exit 1
fi

if awk -F',' -v e="$email" '$1 == e {found=1; exit} END {exit !found}' data/player.csv; then
    echo "Email sudah terdaftar! Silakan gunakan email lain."
    exit 1
fi

echo -n "Masukkan username : "
read username
echo
if awk -F',' -v u="$username" '$2 == u {found=1; exit} END {exit !found}' "$file_database"; then
    echo "Error: Username sudah terdaftar. Silakan gunakan username lain."
    exit 1
fi

echo -n "Masukkan password : "
read -s password
echo

echo -n "Konfirmasi password : "
read -s password_confirm
echo

if [[ ${#password} -lt 8 ]]; then
    echo "Error: Format password harus minimal 8 karakter."
    exit 1
fi

if [[ ! "$password" =~ [A-Z] ]]; then
    echo "Error: Password harus mengandung setidaknya satu huruf besar."
    exit 1
fi

if [[ ! "$password" =~ [a-z] ]]; then
    echo "Error: Password harus mengandung setidaknya satu huruf kecil."
    exit 1
fi

if [[ ! "$password" =~ [0-9] ]]; then
    echo "Error: Password harus mengandung setidaknya satu angka."
    exit 1
fi

if [[ "$password" != "$password_confirm" ]]; then
    echo "Error: Password tidak sesuai."
    exit 1
fi

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
echo "$email,,$hashed_password" >> "$file_database"
echo "Registrasi berhasil! Silakan login."
