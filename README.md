# Sisop-1-2025-IT29

Soal Modul 1
Sistem Operasi 2025

Waktu pengerjaan dimulai hari Senin (10 Maret 2025) setelah sesi lab hingga hari Sabtu (15 Maret 2025) pukul 23.59 WIB.
Praktikan diharapkan membuat laporan penjelasan dan penyelesaian soal dalam bentuk Readme(github).
Format nama repository github “Sisop-[Nomor Modul]-2025-[Nama Kelompok]” (contoh:Sisop-1-2025-IT01).
Struktur repository seperti berikut:
			—soal_1:
				— poppo_siroyo.sh
                                    
			—soal_2:
├── login.sh
├── register.sh
├── scripts/
│   ├── core_monitor.sh
│   ├── frag_monitor.sh
│   └── manager.sh
└── terminal.sh
			
—soal_3:	
	— dsotm.sh
			—soal_4:
— pokemon_analysis.sh
				

	Jika melanggar struktur repo akan dianggap sama dengan curang dan menerima konsekuensi sama dengan melakukan kecurangan.
Setelah pengerjaan selesai, semua script bash, awk, dan file yang berisi cron job ditaruh di github masing - masing kelompok, dan link github diletakkan pada form yang disediakan. Pastikan github di setting ke publik.
Commit terakhir maksimal 10 menit setelah waktu pengerjaan berakhir. Jika melewati maka akan dinilai berdasarkan commit terakhir.
Jika tidak ada pengumuman perubahan soal oleh asisten, maka soal dianggap dapat diselesaikan.
Jika ditemukan soal yang tidak dapat diselesaikan, harap menuliskannya pada Readme beserta permasalahan yang ditemukan.
Praktikan tidak diperbolehkan menanyakan jawaban dari soal yang diberikan kepada asisten maupun praktikan dari kelompok lainnya.
Jika ditemukan indikasi kecurangan dalam bentuk apapun di pengerjaan soal shift, maka nilai dianggap 0.
Pengerjaan soal shift sesuai dengan modul yang telah diajarkan.
Zip dari repository dikumpulkan di google form yang terdapat pada linktree.
Jika terdapat revisi soal akan dituliskan pada halaman terakhir.
Di sebuah desa kecil yang dikelilingi bukit hijau, Poppo dan Siroyo, dua sahabat karib, sering duduk di bawah pohon tua sambil membayangkan petualangan besar. Poppo, yang ceria dan penuh semangat, baru menemukan kesenangan dalam dunia buku, sementara Siroyo, dengan otaknya yang tajam, suka menganalisis segala hal. Suatu hari, mereka menemukan tablet ajaib berisi catatan misterius bernama reading_data.csv. Dengan bantuan keajaiban awk, mereka memutuskan untuk menjelajahi rahasia di balik data itu, siap menghadapi tantangan demi tantangan dalam petualangan baru mereka. [Author: Azza / trenttzzz]
Poppo baru saja mulai melihat tablet ajaib dan terpukau dengan kekerenan orang bernama “Chris Hemsworth”. Poppo jadi sangat ingin tahu berapa banyak buku yang dibaca oleh “Chris Hemsworth”. Bantu Poppo menghitung jumlah baris di tablet ajaib yang menunjukkan buku-buku yang dibaca oleh Chris Hemsworth.
Contoh Output:
Chris Hemsworth membaca 2 buku.
Setelah menemukan tablet ajaib, Siroyo mulai penasaran dengan kebiasaan membaca yang tersimpan di dalamnya. Ia mulai menggunakan tablet ajaib dan bergumam sambil meneliti, “Aku ingin tahu berapa lama rata-rata mereka membaca dengan benda ini”. Bantu Siroyo untuk menghitung rata-rata durasi membaca (Reading_Duration_Minutes) untuk buku-buku yang dibaca menggunakan “Tablet” 
Contoh Output:
Rata-rata durasi membaca dengan Tablet adalah 60.5 menit.
Sementara Siroyo sibuk menganalisis tablet ajaib, Poppo duduk disampingnya dengan ide cemerlang. “Kalau kita sudah tahu cara mereka membaca, aku ingin memberi hadiah ke temen yang paling suka sama bukunya!”. Ia pun mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca (Rating) beserta nama (Name) dan judul bukunya (Book_Title).
Contoh Output:
Pembaca dengan rating tertinggi: Brie Larson - Business Strategies - 4.7
Siroyo mengusap keningnya dan berkata, "Petualangan kita belum selesai! Aku harus bikin laporan untuk klub buku besok." Ia ingin membuat laporan yang istimewa dengan tablet ajaib itu, fokus pada teman-teman di Asia. "Aku penasaran genre apa yang paling populer di sana setelah tahun 2023," katanya, membuka reading_data.csv sekali lagi. Bantu Siroyo menganalisis data untuk menemukan genre yang paling sering dibaca di Asia setelah 31 Desember 2023, beserta jumlahnya, agar laporannya jadi yang terbaik di klub.
Contoh Output:
Genre paling populer di Asia setelah 2023 adalah Science dengan 1 buku.

Note:
Seluruh command dimasukkan kedalam 1 file dan gunakan kondisi if else untuk setiap soalnya.

Anda merupakan seorang “Observer”, dari banyak dunia yang dibuat dari ingatan yang berbentuk “fragments” - yang berisi kemungkinan yang dapat terjadi di dunia lain. Namun, akhir-akhir ini terdapat anomali-anomali yang seharusnya tidak terjadi, perpindahan “fragments” di berbagai dunia, yang kemungkinan terjadi dikarenakan seorang “Seeker” yang berubah menjadi “Ascendant”, atau dalam kata lain, “God”. Tidak semua “Observer” menjadi “Player”, tetapi disini anda ditugaskan untuk ikut serta dalam menjaga equilibrium dari dunia-dunia yang terbuat dari “Arcaea”. [Author: Nathan / etern1ty]
“First Step in a New World”
Tugas pertama, dikarenakan kejadian “Axiom of The End” yang semakin mendekat, diperlukan sistem untuk mencatat “Player” aktif agar terpisah dari “Observer”. Buatlah dua shell script, login.sh dan register.sh, yang dimana database “Player” disimpan di /data/player.csv. Untuk register, parameter yang dipakai yaitu email, username, dan password. Untuk login, parameter yang dipakai yaitu email dan password.
“Radiant Genesis”
Sistem login/register untuk para "Player" tentunya memiliki constraint, yaitu validasi email dan password. 
Email harus memiliki format yang benar dengan tanda @ dan titik, sementara password harus memiliki minimal 8 karakter, setidaknya satu huruf kecil, satu huruf besar, dan satu angka untuk menjaga keamanan data di dunia “Arcaea”.
Ex (tidak harus sama, kebebasan artistik praktikan):

“Unceasing Spirit”
Karena diperlukan pengecekan keaslian “Player” yang aktif, maka diperlukan sistem untuk pencegahan duplikasi “Player”. Jadikan sistem login/register tidak bisa memakai email yang sama (email = unique), tetapi tidak ada pengecekan tambahan untuk username.
“The Eternal Realm of Light”
Password adalah kunci akses ke dunia Arcaea. Untuk menjaga keamanan "Player", password perlu disimpan dalam bentuk yang tidak mudah diakses. Gunakan algoritma hashing sha256sum yang memakai static salt (bebas).
“The Brutality of Glass”
Setelah sukses login, "Player" perlu memiliki akses ke sistem pemantauan sumber daya. Sistem harus dapat melacak penggunaan CPU (dalam persentase) yang menjadi representasi “Core” di dunia “Arcaea”. Pastikan kalian juga bisa melacak “terminal” yang digunakan oleh “Player”, yaitu CPU Model dari device mereka. 
Lokasi shell script: ./scripts/core_monitor.sh
Hint: bash - How to get overall CPU usage (e.g. 57%) on Linux - Stack Overflow
“In Grief and Great Delight”
Selain CPU, “fragments” juga perlu dipantau untuk memastikan equilibrium dunia “Arcaea”. RAM menjadi representasi dari “fragments” di dunia “Arcaea”, yang dimana dipantau dalam persentase usage, dan juga penggunaan RAM sekarang. 
Lokasi shell script: ./scripts/frag_monitor.sh
Pastikan perhitungan kalian untuk CPU dan RAM memiliki output yang sama dengan suatu package resource checker, ex: top, htop, btop, bpytop. 

“On Fate's Approach”
Pemantauan yang teratur dan terjadwal sangat penting untuk mendeteksi anomali. Crontab manager (suatu menu) memungkinkan "Player" untuk mengatur jadwal pemantauan sistem. 
Hal yang harus ada di fungsionalitas menu:
Add/Remove CPU [Core] Usage
Add/Remove RAM [Fragment] Usage
View Active Jobs
Lokasi shell script: ./scripts/manager.sh
Ex (tidak harus sama, kebebasan artistik praktikan):

“The Disfigured Flow of Time”
Karena tentunya script yang dimasukkan ke crontab tidak mengeluarkan output di terminal, buatlah 2 log file, core.log dan fragment.log di folder ./log/, yang dimana masing-masing terhubung ke program usage monitoring untuk usage tersebut. 
Format log:
CPU
[YYYY-MM-DD HH:MM:SS] - Core Usage [$CPU%] - Terminal Model [$CPU_Model]

RAM
[YYYY-MM-DD HH:MM:SS] - Fragment Usage [$RAM%] - Fragment Count [$RAM MB] - Details [Total: $TOTAL MB, Available: $AVAILABLE MB]

Ex: 


“Irruption of New Color”
Sistem harus memiliki antarmuka utama yang menggabungkan semua komponen. Ini akan menjadi titik masuk bagi "Player" untuk mengakses seluruh sistem. Buatlah shell script terminal.sh, yang berisi user flow berikut:
Register
Login
Crontab manager (add/rem core & fragment usage)
Exit
Exit
Struktur directory lengkap:


Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara ./dsotm.sh --play=”<Track>” dengan Track sebagai nama nama lagu yang kamu pilih. [Author: Afnaan / honque]
Speak to Me
Untuk lagu ini, kamu memutuskan untuk membuat sebuah fitur yang memanggil API yang baru saja kamu temukan kemarin, https://github.com/annthurium/affirmations untuk menampilkan word of affirmation setiap detik.
Speak to Me.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, word of affirmation baru harus ditampilkan tiap detik.
On the Run
Selanjutnya, kamu memutuskan untuk membuat sebuah progress bar yang berjalan dengan interval random (setiap progress bertambah dalam interval waktu yang random dengan range 0.1 detik sampai 1 detik).
On the Run.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, progress bar harus memiliki perhitungan persentase, dan panjang dari progress bar tidak berubah ubah (selalu dari ujung kiri terminal ke ujung kanan terminal seperti pada gif)
Time
Singkat saja, untuk time, kamu memutuskan untuk membuat live clock yang menunjukkan tanggal, jam, menit dan detik.
Time.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, jam harus setidaknya menunjukkan tahun, bulan, tanggal, jam, menit, dan detik yang diperbaharui setiap detik.
Money
Kamu teringat dengan program yang sangat disukai oleh teman mu yang bernama cmatrix. Kamu pun memutuskan untuk membuat program yang mirip, tetapi mengganti isinya dengan simbol mata uang seperti $ € £ ¥ ¢ ₹ ₩ ₿ ₣ dan lain lainnya.
Money.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, matrix tersusun oleh simbol mata uang minimal 5 simbol yang berbeda.
Brain Damage
Untuk lagu Brain Damage, kamu mendapatkan ide untuk menampilkan proses yang sedang berjalan, seperti task manager tetapi menampilkannya di dalam terminal dan membuat agar task manager tersebut menampilkan data baru setiap detiknya.
Brain Damage.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, data harus sesuai dengan ps/top dan sejenisnya.

Pada suatu hari, anda diminta teman anda untuk membantunya mempersiapkan diri untuk turnamen Pokemon “Generation 9 OverUsed 6v6 Singles” dengan cara membuatkan tim yang cocok untuknya. Tetapi, anda tidak memahami meta yang dimainkan di turnamen tersebut. Untungnya, seorang informan memberikan anda data pokemon_usage.csv yang bisa anda download dan analisis. 
[Author: Amoes / winter]
Data tersebut memiliki banyak kolom:
Nama Pokemon
Usage% yang merupakan persentase Pokemon yang disesuaikan dengan Rank pengguna dan Winrate
Raw Usage yang merupakan jumlah mentah Pokemon dalam semua tim yang tercatat
Type1 dan Type2 Pokemon
Statistic Pokemon: HP,Atk,Def,SpAtk,SpDef,Speed
Untuk menganalisis data tersebut dengan baik, anda berpikiran untuk membuat script yang bernama pokemon_analysis.sh dengan fitur sebagai berikut:
Melihat summary dari data
Untuk mengetahui Pokemon apa yang sedang membawa teror kepada lingkungan “Generation 9 OverUsed” anda berusaha untuk membuat sebuah fitur untuk menampilkan nama Pokemon dengan Usage% dan RawUsage paling tinggi.
Contoh (atur pesan sesuai kreativitas):
./pokemon_analysis.sh pokemon_usage.csv --info
Summary of pokemon_usage.csv
Highest Adjusted Usage:  <namaPokemon> with 31.0927%
Highest Raw Usage:   	<namaPokemon> with 563831 uses


Mengurutkan Pokemon berdasarkan data kolom
Untuk memastikan bahwa anda mengetahui kondisi lingkungan “Generation 9 OverUsed”, anda berusaha untuk membuat sebuah fitur untuk sort berdasarkan:
Usage%
RawUsage
Nama
HP
Atk
Def
Sp.Atk
Sp.Def
Speed
Sort dilakukan dengan urutan descending untuk semua angka selain nama, yang diurutkan secara alphabetical. Output harus sesuai dengan format csv yang diberikan.
Contoh:
./pokemon_analysis.sh pokemon_usage.csv --sort usage
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
<namaPokemon>,31.09270%,253499,Ground,Flying,75,95,125,45,75,95
<namaPokemon>,27.06328%,563831,Ground,Fighting,115,131,131,53,53,87
<namaPokemon>,22.41954%,224818,Flying,Steel,98,87,105,53,85,67
<namaPokemon>,21.52833%,192107,Dark,Ground,155,110,125,55,80,45
<namaPokemon>,21.27718%,412146,Dark,Steel,100,135,120,60,85,50
... dan seterusnya (195 more lines)


Mencari nama Pokemon tertentu
Setelah mengetahui kondisi lingkungan “Generation 9 OverUsed”, anda ingin mencari tahu statistik penggunaan dari beberapa Pokemon yang mungkin dapat bertanding baik melawan sebagian besar Pokemon yang ada di Top 10 usage. Oleh karena itu, anda membuat fitur search berdasarkan nama Pokemon. Pastikan agar search yang dimasukkan tidak memunculkan hasil yang tidak diinginkan (seperti memunculkan semua Grass type ketika mengetik search “Grass”), dan output harus sesuai dengan format csv yang diberikan dengan sort Usage%.
Contoh:
./pokemon_analysis.sh pokemon_usage.csv --grep rotom
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Rotom-Wash,1.62637%,71243,Electric,Water,50,65,107,105,107,86


Mencari Pokemon berdasarkan filter nama type
Agar dapat membuat tim yang baik, anda perlu memikirkan kombinasi yang baik dari beberapa Pokemon, hal ini disebut sebagai “core” oleh komunitas Pokemon! Oleh karena itu, anda berpikiran untuk membuat fitur filter berdasarkan Type sebuah Pokemon. Output harus sesuai dengan format csv yang diberikan dengan sort Usage%
Contoh:
./pokemon_analysis.sh pokemon_usage.csv --filter dark
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Ting-Lu,21.52833%,192107,Dark,Ground,155,110,125,55,80,45
Kingambit,21.27718%,412146,Dark,Steel,100,135,120,60,85,50
Roaring Moon,12.32447%,230323,Dragon,Dark,105,139,71,55,101,119
Samurott-Hisui,10.89438%,214350,Water,Dark,90,108,80,100,65,85
Darkrai,10.40132%,170900,Dark,None,70,90,90,135,90,125
Weavile,7.75603%,79409,Dark,Ice,70,120,65,45,85,125
... dan seterusnya (20 more lines)


Error handling
Pastikan program yang anda buat mengecek semua kesalahan pengguna agar dapat memberikan kejelasan kepada pengguna pada setiap kasus.
Contoh:
./pokemon_analysis.sh pokemon_usage.csv --filter
Error: no filter option provided
Use -h or --help for more information


Help screen yang menarik
Untuk memberikan petunjuk yang baik pada pengguna program, anda berpikir untuk membuat sebuah help screen yang muncul ketika mengetik -h atau --help sebagai command yang dijalankan. Kriteria yang harus ada dalam help screen pada program ini adalah:
ASCII Art yang menarik! Gunakan kreativitas anda untuk mencari/membuat art yang cocok untuk program yang sudah anda buat!
Penjelasan setiap command dan sub-command
Contoh:

