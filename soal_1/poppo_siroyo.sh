#!/bin/bash

#Banyak Chris Hemsworth membaca buku 
jumlah_chris=$(awk -F ',' 'NR > 1 && $2 == "Chris Hemsworth" {count++} END {print "Chris Hemsworth membaca", count, "buku."}' reading_data.csv)

#Rata - rata durasi membaca dengan tablet
rata_rata=$(awk -F ',' 'NR > 1 && $8 == "Tablet" {sum += $6; count++} END {if (count > 0) print sum/count; else print "0" }' reading_data.csv)

#Rating tertinggi pembaca
rating_tertinggi=$(awk -F ',' 'NR > 1 {if ($7 > max) {max = $7; name = $2; book = $3}} END {print name, "-", book, "-", max}' reading_data.csv)

#Genre populer setelah tahun 2023
genre_popular=$(awk -F',' '$9=="Asia" && $5>"2023-12-31" {count[$4]++} END {max = 0; for (genre in count) {if (count[genre] > max) {max = count[genre]; popular = genre}} print popular, max}' reading_data.csv)

#Print results
echo "$jumlah_chris"
echo "Rata - rata durasi membaca dengan Tablet adalah $rata_rata menit."
echo "Pembaca dengan rating tertinggi : $rating_tertinggi"
echo "Genre paling popoler di Asia setelah tahun 2023 adalah $genre_popular" 

