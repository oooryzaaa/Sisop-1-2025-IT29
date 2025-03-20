# Sisop-1-2025-IT29

- Bayu Kurniawan - 5027241055
- Angga Firmansyah - 5027241062
- Oryza Qiara Ramadhani - 5027241084

# Soal 1
Di sebuah desa kecil yang dikelilingi bukit hijau, Poppo dan Siroyo, dua sahabat karib, sering duduk di bawah pohon tua sambil membayangkan petualangan besar. Poppo, yang ceria dan penuh semangat, baru menemukan kesenangan dalam dunia buku, sementara Siroyo, dengan otaknya yang tajam, suka menganalisis segala hal. Suatu hari, mereka menemukan tablet ajaib berisi catatan misterius bernama reading_data.csv. Dengan bantuan keajaiban awk, mereka memutuskan untuk menjelajahi rahasia di balik data itu, siap menghadapi tantangan demi tantangan dalam petualangan baru mereka.

a. Poppo baru saja mulai melihat tablet ajaib dan terpukau dengan kekerenan orang bernama “Chris Hemsworth”. Poppo jadi sangat ingin tahu berapa banyak buku yang dibaca oleh “Chris Hemsworth”. Bantu Poppo menghitung jumlah baris di tablet ajaib yang menunjukkan buku-buku yang dibaca oleh Chris Hemsworth.
Contoh Output:
Chris Hemsworth membaca 2 buku.

b. Setelah menemukan tablet ajaib, Siroyo mulai penasaran dengan kebiasaan membaca yang tersimpan di dalamnya. Ia mulai menggunakan tablet ajaib dan bergumam sambil meneliti, “Aku ingin tahu berapa lama rata-rata mereka membaca dengan benda ini”. Bantu Siroyo untuk menghitung rata-rata durasi membaca (Reading_Duration_Minutes) untuk buku-buku yang dibaca menggunakan “Tablet” 
Contoh Output:
Rata-rata durasi membaca dengan Tablet adalah 60.5 menit

c. Sementara Siroyo sibuk menganalisis tablet ajaib, Poppo duduk disampingnya dengan ide cemerlang. “Kalau kita sudah tahu cara mereka membaca, aku ingin memberi hadiah ke temen yang paling suka sama bukunya!”. Ia pun mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca (Rating) beserta nama (Name) dan judul bukunya (Book_Title).
Contoh Output:
Pembaca dengan rating tertinggi: Brie Larson - Business Strategies - 4.7

d. Siroyo mengusap keningnya dan berkata, "Petualangan kita belum selesai! Aku harus bikin laporan untuk klub buku besok." Ia ingin membuat laporan yang istimewa dengan tablet ajaib itu, fokus pada teman-teman di Asia. "Aku penasaran genre apa yang paling populer di sana setelah tahun 2023," katanya, membuka reading_data.csv sekali lagi. Bantu Siroyo menganalisis data untuk menemukan genre yang paling sering dibaca di Asia setelah 31 Desember 2023, beserta jumlahnya, agar laporannya jadi yang terbaik di klub.
Contoh Output:
Genre paling populer di Asia setelah 2023 adalah Science dengan 1 buku.

Note:
Seluruh command dimasukkan kedalam 1 file dan gunakan kondisi if else untuk setiap soalnya.

# Soal 2
Anda merupakan seorang “Observer”, dari banyak dunia yang dibuat dari ingatan yang berbentuk “fragments” - yang berisi kemungkinan yang dapat terjadi di dunia lain. Namun, akhir-akhir ini terdapat anomali-anomali yang seharusnya tidak terjadi, perpindahan “fragments” di berbagai dunia, yang kemungkinan terjadi dikarenakan seorang “Seeker” yang berubah menjadi “Ascendant”, atau dalam kata lain, “God”. Tidak semua “Observer” menjadi “Player”, tetapi disini anda ditugaskan untuk ikut serta dalam menjaga equilibrium dari dunia-dunia yang terbuat dari “Arcaea”.

a. “First Step in a New World”
Tugas pertama, dikarenakan kejadian “Axiom of The End” yang semakin mendekat, diperlukan sistem untuk mencatat “Player” aktif agar terpisah dari “Observer”. Buatlah dua shell script, login.sh dan register.sh, yang dimana database “Player” disimpan di /data/player.csv. Untuk register, parameter yang dipakai yaitu email, username, dan password. Untuk login, parameter yang dipakai yaitu email dan password.

b. “Radiant Genesis”
Sistem login/register untuk para "Player" tentunya memiliki constraint, yaitu validasi email dan password. 
Email harus memiliki format yang benar dengan tanda @ dan titik, sementara password harus memiliki minimal 8 karakter, setidaknya satu huruf kecil, satu huruf besar, dan satu angka untuk menjaga keamanan data di dunia “Arcaea”.

c. “Unceasing Spirit”
Karena diperlukan pengecekan keaslian “Player” yang aktif, maka diperlukan sistem untuk pencegahan duplikasi “Player”. Jadikan sistem login/register tidak bisa memakai email yang sama (email = unique), tetapi tidak ada pengecekan tambahan untuk username.

d. “The Eternal Realm of Light”
Password adalah kunci akses ke dunia Arcaea. Untuk menjaga keamanan "Player", password perlu disimpan dalam bentuk yang tidak mudah diakses. Gunakan algoritma hashing sha256sum yang memakai static salt (bebas).

e. “The Brutality of Glass”
Setelah sukses login, "Player" perlu memiliki akses ke sistem pemantauan sumber daya. Sistem harus dapat melacak penggunaan CPU (dalam persentase) yang menjadi representasi “Core” di dunia “Arcaea”. Pastikan kalian juga bisa melacak “terminal” yang digunakan oleh “Player”, yaitu CPU Model dari device mereka. 
Lokasi shell script: ./scripts/core_monitor.sh
Hint: bash - How to get overall CPU usage (e.g. 57%) on Linux - Stack Overflow

f. “In Grief and Great Delight”
Selain CPU, “fragments” juga perlu dipantau untuk memastikan equilibrium dunia “Arcaea”. RAM menjadi representasi dari “fragments” di dunia “Arcaea”, yang dimana dipantau dalam persentase usage, dan juga penggunaan RAM sekarang. 
Lokasi shell script: ./scripts/frag_monitor.sh
Pastikan perhitungan kalian untuk CPU dan RAM memiliki output yang sama dengan suatu package resource checker, ex: top, htop, btop, bpytop. 

g. “On Fate's Approach”
Pemantauan yang teratur dan terjadwal sangat penting untuk mendeteksi anomali. Crontab manager (suatu menu) memungkinkan "Player" untuk mengatur jadwal pemantauan sistem. 
Hal yang harus ada di fungsionalitas menu:
Add/Remove CPU [Core] Usage
Add/Remove RAM [Fragment] Usage
View Active Jobs
Lokasi shell script: ./scripts/manager.sh

h. “The Disfigured Flow of Time”
Karena tentunya script yang dimasukkan ke crontab tidak mengeluarkan output di terminal, buatlah 2 log file, core.log dan fragment.log di folder ./log/, yang dimana masing-masing terhubung ke program usage monitoring untuk usage tersebut. 
Format log:
CPU
[YYYY-MM-DD HH:MM:SS] - Core Usage [$CPU%] - Terminal Model [$CPU_Model]

RAM
[YYYY-MM-DD HH:MM:SS] - Fragment Usage [$RAM%] - Fragment Count [$RAM MB] - Details [Total: $TOTAL MB, Available: $AVAILABLE MB]

i. “Irruption of New Color”
Sistem harus memiliki antarmuka utama yang menggabungkan semua komponen. Ini akan menjadi titik masuk bagi "Player" untuk mengakses seluruh sistem. Buatlah shell script terminal.sh, yang berisi user flow berikut:
- Register
- Login
   - Crontab manager (add/rem core & fragment usage)
   - Exit
-Exit

# Soal 3
untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan
setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program
ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara ./dsotm.sh --
play=”<Track>” dengan Track sebagai nama nama lagu yang kamu pilih.


 a. Untuk lagu ini, kamu memutuskan untuk membuat sebuah fitur yang memanggil API yang baru saja kamu temukan kemarin, https://github.com/annthurium/affirmations untuk
 menampilkan word of affirmation setiap detik.
 Speak to Me.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, word of affirmation baru harus ditampilkan tiap detik.


b. On the Run
Selanjutnya, kamu memutuskan untuk membuat sebuah progress bar yang berjalan dengan interval random (setiap progress bertambah dalam interval waktu yang random dengan range 0.1
detik sampai 1 detik).
 On the Run.mp4
 Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, progress bar harus memiliki perhitungan persentase, dan panjang dari progress bar tidak berubah ubah (selalu dari ujung kiri terminal ke ujung kanan terminal seperti pada gif)

 
 C. Time
 Singkat saja, untuk time, kamu memutuskan untuk membuat live clock yang menunjukkan tanggal, jam, menit dan detik.
 Time.mp4
 Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, jam harus setidaknya menunjukkan tahun, bulan, tanggal, jam, menit,
 dan detik yang diperbaharui setiap detik.
 
 
 d. Money
 Kamu teringat dengan program yang sangat disukai oleh teman mu yang bernama cmatrix. Kamu pun memutuskan untuk membuat program yang mirip, tetapi mengganti isinya dengan
 simbol mata uang seperti $ € £ ¥ ¢ ₹ ₩ ₿ ₣ dan lain lainnya.
 Money.mp4
 Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, matrix tersusun oleh simbol mata uang minimal 5 simbol yang
 berbeda.
 
 
 e. Brain Damage
 Untuk lagu Brain Damage, kamu mendapatkan ide untuk menampilkan proses yang sedang berjalan, seperti task manager tetapi menampilkannya di dalam terminal dan membuat agar -
 task manager tersebut menampilkan data baru setiap detiknya.
 Brain Damage.mp4
 Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, data harus sesuai dengan ps/top dan sejenisnya.

# Soal 4
Pada suatu hari, anda diminta teman anda untuk membantunya mempersiapkan diri untuk turnamen Pokemon “Generation 9 OverUsed 6v6 Singles” dengan cara membuatkan tim yang cocok untuknya. Tetapi, anda tidak memahami meta yang dimainkan di turnamen tersebut. Untungnya, seorang informan memberikan anda data pokemon_usage.csv yang bisa anda download dan analisis. 
[Author: Amoes / winter]
Data tersebut memiliki banyak kolom:
* Nama Pokemon
* Usage% yang merupakan persentase Pokemon yang disesuaikan dengan Rank pengguna dan Winrate
* Raw Usage yang merupakan jumlah mentah Pokemon dalam semua tim yang tercatat
* Type1 dan Type2 Pokemon
* Statistic Pokemon: HP,Atk,Def,SpAtk,SpDef,Speed
Untuk menganalisis data tersebut dengan baik, anda berpikiran untuk membuat script yang bernama pokemon_analysis.sh dengan fitur sebagai berikut:

A.	Melihat summary dari data
Untuk mengetahui Pokemon apa yang sedang membawa teror kepada lingkungan “Generation 9 OverUsed” anda berusaha untuk membuat sebuah fitur untuk menampilkan nama Pokemon dengan Usage% dan RawUsage paling tinggi

B.	Mengurutkan Pokemon berdasarkan data kolom
Untuk memastikan bahwa anda mengetahui kondisi lingkungan “Generation 9 OverUsed”, anda berusaha untuk membuat sebuah fitur untuk sort berdasarkan:
●	Usage%
●	RawUsage
●	Nama
●	HP
●	Atk
●	Def
●	Sp.Atk
●	Sp.Def
●	Speed
Sort dilakukan dengan urutan descending untuk semua angka selain nama, yang diurutkan secara alphabetical. Output harus sesuai dengan format csv yang diberikan.

C.	Mencari nama Pokemon tertentu
Setelah mengetahui kondisi lingkungan “Generation 9 OverUsed”, anda ingin mencari tahu statistik penggunaan dari beberapa Pokemon yang mungkin dapat bertanding baik melawan sebagian besar Pokemon yang ada di Top 10 usage. Oleh karena itu, anda membuat fitur search berdasarkan nama Pokemon. Pastikan agar search yang dimasukkan tidak memunculkan hasil yang tidak diinginkan (seperti memunculkan semua Grass type ketika mengetik search “Grass”), dan output harus sesuai dengan format csv yang diberikan dengan sort Usage%.

D.	Mencari Pokemon berdasarkan filter nama type
Agar dapat membuat tim yang baik, anda perlu memikirkan kombinasi yang baik dari beberapa Pokemon, hal ini disebut sebagai “core” oleh komunitas Pokemon! Oleh karena itu, anda berpikiran untuk membuat fitur filter berdasarkan Type sebuah Pokemon. Output harus sesuai dengan format csv yang diberikan dengan sort Usage%

E.	Error handling
Pastikan program yang anda buat mengecek semua kesalahan pengguna agar dapat memberikan kejelasan kepada pengguna pada setiap kasus.

F.	Help screen yang menarik
Untuk memberikan petunjuk yang baik pada pengguna program, anda berpikir untuk membuat sebuah help screen yang muncul ketika mengetik -h atau --help sebagai command yang dijalankan. Kriteria yang harus ada dalam help screen pada program ini adalah:
●	ASCII Art yang menarik! Gunakan kreativitas anda untuk mencari/membuat art yang cocok untuk program yang sudah anda buat!
●	Penjelasan setiap command dan sub-command

# Penjelasan
### Soal 1

a. Menghitung jumlah baris di tablet ajaib yang menunjukkan buku-buku yang dibaca oleh Chris Hemsworth.
```
awk -F ',' 'NR > 1 && $2 == "Chris Hemsworth" {count++} END {print "Chris Hemsworth membaca", count, "buku."}' reading_data.csv
```
Command ini melangkahi baris header dengan `NR > 1` dan menghitung (menjumlah) baris pada kolom 2 yang mengandung 'Chris Hemsworth' sebagai total banyak 'Chris Hemsworth' membaca buku. 

b. Menghitung rata-rata durasi membaca untuk buku-buku yang dibaca menggunakan “Tablet”.
```
awk -F ',' 'NR > 1 && $8 == "Tablet" {sum += $6; count++} END {if (count > 0) print sum/count; else print "0" }' reading_data.csv
```
 Line `$8 == "Tablet" {sum += $6; count++}` akan menghitung berapa baris 'Tablet' muncul dan menjumlahkan kolom 6 sebagai jumlah durasi membaca.
 Line `{if (count > 0)` print sum/count apabila didapatkan data hitungan 'Tablet' > 0 maka akan dihitung rata - rata durasi membaca menggunakan Tablet.

c. Mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca beserta nama dan judul bukunya. 

```
awk -F ',' 'NR > 1 {if ($7 > max) {max = $7; name = $2; book = $3}} END {print name, "-", book, "-", max}' reading_data.csv
```
Line `{if ($7 > max) {max = $7; name = $2; book = $3}}` membandingkan jika ada nilai kolom 7 (rating) dengan nilai max, jika memenuhi maka nilai max akan diisi dengan nilai rating tertinggi diikuti pembaca dan judul buku.

d. Mencari genre yang paling sering dibaca di Asia setelah 31 Desember 2023 beserta dengan jumlahnya.

```
awk -F',' '$9=="Asia" && $5>"2023-12-31" {count[$4]++} END {max = 0; for (genre in count) {if (count[genre] > max) {max = count[genre]; popular = genre}} print popular, max}' reading_data.csv
```
Line `'$9=="Asia" && $5>"2023-12-31" {count[$4]++}` dengan mengecek apakah kolom 9 ada 'Asia' kemudian mengfilter kolom 5 dengan jangka waktu setelah tahun 2023, kemudian dengan kriteria 'Asia' dan jangka waktu setelah 2023 akan dihitung jumlah pada masing - masing genre.
Jika pada hitungan genre paling banyak melebihi nilai max maka akan di print popular genre beserta jumlahnya.

Lalu digabung menjadi satu script
```bash
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
```
![image](https://github.com/user-attachments/assets/c75e71d7-97b3-48bc-b4b5-26fda0a86477)

### Soal 2
### Soal 3
# a. Speak To me
Merupakan soal yang mengharuskan memanggil API, dapat diselesaikan sebagai berikut :
```bash
speak_to_me() {
    while true; do
        curl -s "https://www.affirmations.dev" | jq -r '.affirmation'
        sleep 1
    done
}
```
Dimana output akan terlihat sebagai berikut : 
![image](https://github.com/user-attachments/assets/137b0d60-8602-4408-bd82-d6ca5d57931d)
Words of Affirmations akan terus muncul setiap 1 detik 

### Soal 4

