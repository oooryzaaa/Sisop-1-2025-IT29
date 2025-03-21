#!/bin/bash

file_database="data/player.csv"

SALT="C4sPL0ck"

echo -n "Masukkan email: "
read email
echo -n "Masukkan password : "
read -s password
echo 

if ! [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Error: email tidak sesuai format."
    exit 1
fi

if ! [[ ${#password} -ge 8 && "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] ]]; then
    echo "Error: Format password harus minimal 8 karakter dengan 1 huruf kecil, 1 huruf besar, dan satu angka."
    exit 1
fi

hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')

if grep -q "^$email,.*,$hashed_password$" "$file_database"; then
    echo "Login berhasil!"
    ./terminal.sh  
else
    echo "Email atau password tidak sesuai."
    exit 1
fi


