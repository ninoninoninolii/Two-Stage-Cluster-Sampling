# ESTIMASI TINGKAT PENGGUNAAN E-WALLET PADA MAHASISWA PROGRAM STUDI STATISTIKA UNIVERSITAS MATARAM

---

## Deskripsi Proyek
Penelitian ini bertujuan untuk mengestimasi tingkat penggunaan _electronic wallet_ (e-wallet) pada mahasiswa Program Studi Statistika Universitas Mataram menggunakan metode _Two Stage Cluster Sampling_. Pengumpulan data dilakukan melalui penyebaran kuesioner kepada responden yang dipilih secara bertahap, yaitu melalui pemilihan _cluster_ pada tahap pertama dan pemilihan responden secara acak pada tahap kedua. Data yang diperoleh dianalisis menggunakan perangkat lunak R dengan tahapan meliputi impor data, uji validitas dan reliabilitas instrumen, statistik deskriptif, perhitungan bobot sampel, estimasi parameter survei menggunakan package survey, serta visualisasi hasil penelitian. Repository ini memuat seluruh tahapan analisis, mulai dari metodologi penelitian, syntax R yang digunakan, hasil estimasi, visualisasi data, hingga pembahasan, kesimpulan, dan saran sehingga dapat digunakan sebagai dokumentasi sekaligus referensi dalam analisis survei menggunakan metode _Two Stage Cluster Sampling_.

---

## Latar Belakang
Penggunaan teknologi dalam bidang keuangan semakin berkembang dan menjadi bagian dari kehidupan sehari-hari masyarakat saat ini. Salah satu bentuk teknologi tersebut adalah _electronic wallet_ (e-wallet), yaitu layanan pembayaran digital yang memudahkan pengguna dalam melakukan transaksi tanpa harus menggunakan uang tunai. E-wallet banyak dipilih karena proses transaksinya cepat, praktis, dan dapat digunakan untuk berbagai kebutuhan, seperti berbelanja, membayar tagihan, hingga membeli makanan secara online. Kemudahan tersebut membuat e-wallet semakin banyak digunakan oleh berbagai kalangan, termasuk mahasiswa (Rachmad _et al._, 2024).

Mahasiswa merupakan salah satu kelompok yang cukup aktif menggunakan e-wallet karena aktivitas sehari-hari mereka tidak terlepas dari penggunaan teknologi. E-wallet dimanfaatkan mahasiswa untuk berbagai keperluan, seperti membeli makanan dan minuman, berbelanja di _marketplace_, membayar transportasi online, hingga melakukan pembayaran lainnya. Kemudahan penggunaan dan manfaat yang dirasakan membuat mahasiswa lebih memilih menggunakan e-wallet dibandingkan metode pembayaran tunai. Hal tersebut menunjukkan bahwa e-wallet sudah menjadi salah satu alat pembayaran yang sering digunakan oleh mahasiswa dalam memenuhi kebutuhan sehari-hari (Mawardi & Sholihah, 2023).

Beberapa penelitian menunjukkan bahwa penggunaan e-wallet pada mahasiswa dipengaruhi oleh beberapa faktor. Manfaat yang diperoleh setelah menggunakan e-wallet menjadi salah satu alasan yang mendorong mahasiswa untuk terus menggunakannya (Rachmawati & Trisnaningsih, 2023). Selain itu, kemudahan penggunaan, pengaruh teman atau lingkungan, serta gaya hidup juga ikut memengaruhi keputusan seseorang dalam menggunakan e-wallet (Nugroho & Pramudita, 2023). Penelitian lain juga menyebutkan bahwa kondisi pendukung dan harapan pengguna terhadap kinerja e-wallet berpengaruh terhadap minat menggunakan layanan tersebut (Rachmad _et al._, 2024). Hasil penelitian tersebut menunjukkan bahwa penggunaan e-wallet di kalangan mahasiswa dipengaruhi oleh berbagai faktor sehingga tingkat penggunaannya dapat berbeda pada setiap kelompok mahasiswa (Khofifah & Kardiyem, 2024).

Program Studi Statistika Universitas Mataram merupakan salah satu program studi yang mahasiswanya juga memanfaatkan e-wallet dalam berbagai aktivitas sehari-hari. Namun, informasi mengenai tingkat penggunaan e-wallet pada mahasiswa Program Studi Statistika Universitas Mataram masih belum diketahui secara pasti. Oleh karena itu, perlu dilakukan penelitian untuk memperoleh gambaran mengenai tingkat penggunaan e-wallet pada mahasiswa Program Studi Statistika Universitas Mataram. Penelitian ini bertujuan untuk mengestimasi tingkat penggunaan e-wallet pada mahasiswa Program Studi Statistika Universitas Mataram menggunakan metode _Two Stage Cluster Sampling_, sehingga hasil estimasi yang diperoleh dapat mewakili kondisi populasi. Hasil penelitian ini diharapkan dapat menjadi sumber informasi mengenai penggunaan e-wallet di kalangan mahasiswa serta menjadi referensi bagi penelitian selanjutnya yang berkaitan dengan perilaku penggunaan pembayaran digital.

---

## Metodologi Penelitian

### Jenis Penelitian

Penelitian ini menggunakan pendekatan kuantitatif dengan jenis penelitian deskriptif. Pendekatan kuantitatif dipilih karena data yang dianalisis berupa data numerik yang diperoleh melalui penyebaran kuesioner kepada responden. Data tersebut kemudian diolah menggunakan metode statistika untuk mengestimasi tingkat penggunaan *e-wallet* pada mahasiswa Program Studi Statistika Universitas Mataram.

### Populasi dan Sampel

Populasi dalam penelitian ini adalah seluruh mahasiswa aktif Program Studi Statistika Universitas Mataram yang berjumlah 154 mahasiswa. Dalam penelitian ini, unit cluster ditentukan berdasarkan kelas sehingga populasi terbagi menjadi enam cluster, yaitu kelas A dan B pada masing-masing angkatan 2023, 2024, dan 2025.

#### Tabel 1. Cluster Penelitian

| No | Cluster |
|:--:|----------|
| 1 | 2023 A |
| 2 | 2023 B |
| 3 | 2024 A |
| 4 | 2024 B |
| 5 | 2025 A |
| 6 | 2025 B |

Teknik pengambilan sampel yang digunakan adalah *Two Stage Cluster Sampling*, yaitu teknik pengambilan sampel yang dilakukan melalui dua tahapan.

- #### Tahap 1. Pemilihan Cluster

Pada tahap pertama dilakukan pemilihan cluster dari enam kelas yang tersedia. Berdasarkan proses pemilihan cluster, diperoleh dua kelas yang terpilih sebagai cluster penelitian, yaitu kelas 2024A dan 2025A.

#### Tabel 2. Cluster Terpilih

| No | Cluster Terpilih |
|:--:|------------------|
| 1 | 2024 A |
| 2 | 2025 A |

- #### Tahap 2. Pemilihan Responden

Setelah cluster terpilih ditentukan, dilakukan pemilihan responden pada masing-masing cluster menggunakan metode *Simple Random Sampling*. Setiap mahasiswa dalam cluster terpilih memiliki peluang yang sama untuk menjadi sampel penelitian. Pemilihan responden dilakukan secara acak hingga diperoleh jumlah sampel yang ditetapkan dalam penelitian.

#### Tabel 3. Distribusi Sampel Penelitian

| Cluster | Jumlah Populasi | Jumlah Sampel |
|:---------|----------------:|--------------:|
| 2024 A | 26 | 10 |
| 2025 A | 32 | 20 |
| Total | **58** | **30** |

### Teknik Pengumpulan Data

Data yang digunakan dalam penelitian ini merupakan data primer yang diperoleh melalui penyebaran kuesioner kepada responden. Instrumen penelitian terdiri atas 10 butir pernyataan yang digunakan untuk mengukur tingkat penggunaan *e-wallet*. Setiap butir pernyataan disusun menggunakan skala Likert lima tingkat. Skor dari setiap jawaban kemudian dijumlahkan sehingga diperoleh skor total yang digunakan sebagai dasar analisis.

#### Tabel 4. Skala Penilaian Kuesioner

| Pilihan Jawaban | Skor |
|:----------------|----:|
| Sangat Tidak Setuju (STS) | 1 |
| Tidak Setuju (TS) | 2 |
| Netral (N) | 3 |
| Setuju (S) | 4 |
| Sangat Setuju (SS) | 5 |

### Alur Analisis

Analisis data dalam penelitian ini dilakukan secara bertahap menggunakan perangkat lunak R. Tahapan analisis dimulai dari proses impor data hingga penyajian hasil estimasi dan visualisasi data. Adapun alur analisis penelitian ditunjukkan sebagai berikut.

```text
Import Data
        ↓
Uji Validitas
        ↓
Uji Reliabilitas
        ↓
Statistik Deskriptif
        ↓
Perhitungan Peluang Pemilihan Sampel
        ↓
Perhitungan Bobot Sampling
        ↓
Pembuatan Desain Survei
        ↓
Estimasi Tingkat Penggunaan E-Wallet
        ↓
Analisis Kualitas Estimasi
(Standard Error, Confidence Interval,
Relative Standard Error, dan Design Effect)
        ↓
Visualisasi Data
        ↓
Hasil dan Pembahasan
        ↓
Kesimpulan
```

### Teknik Analisis Data

#### 1. Import Data

Tahap ini bertujuan untuk mengimpor data populasi dan data sampel hasil penyebaran kuesioner ke dalam perangkat lunak R. Selain itu, pada tahap ini dilakukan penyesuaian nama variabel, pendefinisian item pertanyaan, mengubah tipe data setiap item menjadi numerik, menghitung skor total, serta menghitung rata-rata skor penggunaan *e-wallet*. Hasil dari tahap ini menjadi dasar dalam proses analisis pada tahapan berikutnya.

#### Syntax
```r
library(readxl)
library(psych)

data <- read_excel("C:/Users/HP/Documents/RESPONDEN.xlsx")
View(data)
```

#### Keterangan
- `library(readxl)` digunakan untuk memanggil package `readxl` agar data Excel dapat dibaca ke R.
- `library(psych)` digunakan untuk analisis psikometri termasuk uji reliabilitas.
- `read_excel()` digunakan untuk mengimpor data responden dari file Excel.
- `View()` digunakan untuk menampilkan dataset sebelum dianalisis.
  
#### 2. Uji Validitas

Tujuannya untuk melihat apakah setiap pertanyaan (P1 sampai P10) benar-benar mampu mengukur konsep yang ingin diteliti, yaitu penggunaan e-wallet. Pengambilan keputusan dilakukan dengan membandingkan nilai r hitung dengan r tabel (0,361). Jika r hitung lebih besar dari r tabel, maka item dinyatakan valid. Jika lebih kecil, maka tidak valid.

#### Syntax
```r
item <- c("P1","P2","P3","P4","P5",
          "P6","P7","P8","P9","P10")

data[item] <- lapply(data[item],
                     function(x) as.numeric(as.character(x)))

data$TOTAL <- rowSums(data[item],
                      na.rm = TRUE)

hasil_validitas <- data.frame(
  
  Item = character(),
  
  r_hitung = numeric(),
  
  p_value = numeric(),
  
  Keputusan = character()
)

for(i in item){
  
  total_koreksi <- data$TOTAL - data[[i]]
  
  uji <- cor.test(
    data[[i]],
    total_koreksi,
    method = "pearson"
  )
  
  hasil_validitas <- rbind(
    hasil_validitas,
    data.frame(
      Item = i,
      r_hitung = round(uji$estimate,3),
      p_value = round(uji$p.value,4),
      Keputusan = ""
    )
  )
}

r_tabel <- 0.361

hasil_validitas$Keputusan <- ifelse(
  hasil_validitas$r_hitung > r_tabel,
  "Valid",
  "Tidak Valid"
)

print(hasil_validitas)
```

#### Keterangan
- `item` digunakan untuk mendefinisikan variabel item P1–P10.
- `lapply()` digunakan untuk mengubah data item menjadi numerik.
- `rowSums()` digunakan untuk menghitung total skor setiap responden.
- `data$TOTAL` digunakan sebagai skor total responden.
- `for(i in item)` digunakan untuk melakukan pengujian validitas setiap item secara berulang.
- `total_koreksi` digunakan untuk menghitung total skor tanpa item yang sedang diuji.
- `cor.test()` digunakan untuk melakukan uji korelasi Pearson.
- `rbind()` digunakan untuk menggabungkan hasil uji validitas setiap item.
- `r_tabel` digunakan sebagai nilai pembanding dalam uji validitas.
- `ifelse()` digunakan untuk menentukan keputusan valid atau tidak valid.
- `print()` digunakan untuk menampilkan hasil uji validitas.

#### 3. Uji Reliabilitas

Tujuannya untuk mengetahui apakah kuesioner yang digunakan konsisten atau stabil jika digunakan berulang. Keputusan diambil berdasarkan nilai Cronbach’s Alpha. Jika nilainya ≥ 0,70 maka instrumen dianggap reliabel, artinya jawaban responden konsisten. Jika kurang dari 0,70 maka tidak reliabel.

#### Syntax
```r
hasil_alpha <- alpha(data[item])

print(hasil_alpha)

cat("Cronbach's Alpha =",
    round(hasil_alpha$total$raw_alpha,3),"/n")

if(hasil_alpha$total$raw_alpha >= 0.70){
  
  cat("Keputusan : Instrumen Reliabel")
  
}else{
  
  cat("Keputusan : Instrumen Tidak Reliabel")
  
}
```

##### Keterangan
- `alpha()` digunakan untuk menghitung nilai Cronbach’s Alpha sebagai ukuran reliabilitas instrumen.
- `data[item]` digunakan sebagai input item pertanyaan dalam perhitungan reliabilitas.
- `print()` digunakan untuk menampilkan hasil output reliabilitas.
- `cat()` digunakan untuk mencetak nilai Cronbach’s Alpha dan keputusan reliabilitas.
- `round()` digunakan untuk membulatkan nilai Cronbach’s Alpha.
- `ifelse()` digunakan untuk menentukan keputusan reliabel atau tidak berdasarkan batas 0.70.

#### 4. Statistik Deskriptif

Tujuannya untuk memberikan gambaran umum data penelitian seperti rata-rata, standar deviasi, nilai minimum, dan maksimum dari skor penggunaan e-wallet. Tidak ada keputusan “diterima atau ditolak” di tahap ini, karena hanya untuk melihat karakteristik data.

#### Syntax
```r
library(readxl)
library(survey)

populasi <- read_excel("C:/Users/HP/Documents/POPULASII.xlsx")
sampel <- read_excel("C:/Users/HP/Documents/SAMPEL.xlsx")

View(populasi)
View(sampel)

names(populasi)[names(populasi)=="Angkatan"] <- "ANGKATAN"

item <- c("P1","P2","P3","P4","P5",
          "P6","P7","P8","P9","P10")

sampel[item] <- lapply(sampel[item],
                       function(x) as.numeric(as.character(x)))

sampel$TOTAL <- rowSums(sampel[item],
                        na.rm = TRUE)

sampel$Rata_EWallet <- rowMeans(sampel[item],
                                na.rm = TRUE)

cat("Rata-rata Skor Penggunaan E-Wallet =",
    round(mean(sampel$Rata_EWallet),2), "\n")

summary(sampel$TOTAL)

cat("Rata-rata =",
    round(mean(sampel$TOTAL),2), "\n")

cat("Standar Deviasi =",
    round(sd(sampel$TOTAL),2), "\n")

cat("Minimum =",
    min(sampel$TOTAL), "\n")

cat("Maksimum =",
    max(sampel$TOTAL), "\n")

table(populasi$ANGKATAN)
table(sampel$ANGKATAN)
```

#### Keterangan
- `library(readxl)` digunakan untuk membaca file Excel.
- `library(survey)` digunakan untuk analisis data survei.
- `populasi` dan `sampel` digunakan untuk menyimpan data penelitian.
- `names()` digunakan untuk menyeragamkan nama variabel.
- `item` digunakan untuk mendefinisikan variabel pertanyaan.
- `lapply()` digunakan untuk konversi data menjadi numerik.
- `rowSums()` digunakan untuk menghitung total skor responden.
- `rowMeans()` digunakan untuk menghitung rata-rata skor penggunaan e-wallet.
- `mean()` digunakan untuk menghitung nilai rata-rata keseluruhan.
- `sd()` digunakan untuk menghitung standar deviasi.
- `min()` digunakan untuk mencari nilai minimum.
- `max()` digunakan untuk mencari nilai maksimum.
- `summary()` digunakan untuk ringkasan statistik deskriptif.
- `table()` digunakan untuk melihat distribusi frekuensi angkatan.
- `cat()` digunakan untuk menampilkan hasil perhitungan.

#### 5. Perhitungan Peluang Pemilihan Sampel

Tahap ini bertujuan untuk menghitung peluang setiap responden terpilih sebagai sampel berdasarkan desain *Two Stage Cluster Sampling*. Peluang pemilihan dihitung melalui peluang pemilihan *cluster* pada tahap pertama dan peluang pemilihan responden pada tahap kedua.

#### Syntax
```r
M <- 6
m <- 2

N2024 <- sum(populasi$ANGKATAN == 2024)
N2025 <- sum(populasi$ANGKATAN == 2025)

n2024 <- sum(sampel$ANGKATAN == 2024)
n2025 <- sum(sampel$ANGKATAN == 2025)

P1 <- m/M

P2_2024 <- n2024/N2024

P2_2025 <- n2025/N2025

Pi_2024 <- P1 * P2_2024

Pi_2025 <- P1 * P2_2025
```

#### Keterangan
- `M` digunakan untuk jumlah seluruh cluster.
- `m` digunakan untuk jumlah cluster yang dipilih.
- `sum()` digunakan untuk menghitung jumlah anggota pada setiap angkatan.
- `P1` digunakan untuk peluang pemilihan cluster tahap pertama.
- `P2_2024` dan `P2_2025` digunakan untuk peluang pemilihan tahap kedua.
- `Pi_2024` dan `Pi_2025` digunakan untuk peluang total pemilihan sampel.

#### 6. Perhitungan Bobot Sampling

Tahap ini bertujuan untuk menghitung bobot setiap responden berdasarkan peluang pemilihannya. Bobot digunakan agar hasil estimasi mampu merepresentasikan kondisi populasi.

#### Syntax
```r
Bobot_2024 <- 1/Pi_2024
Bobot_2025 <- 1/Pi_2025

sampel$Bobot <- ifelse(sampel$ANGKATAN == 2024,
                       Bobot_2024,
                       Bobot_2025)

Target <- 30
Responden <- nrow(sampel)

ResponseRate <- Responden/Target

sampel$Bobot_Akhir <- sampel$Bobot/ResponseRate

hasil <- data.frame(
  
  Angkatan = c("2024","2025"),
  
  Populasi = c(N2024,N2025),
  
  Sampel = c(n2024,n2025),
  
  Peluang = c(Pi_2024,Pi_2025),
  
  Bobot_Dasar = c(Bobot_2024,Bobot_2025),
  
  Bobot_Akhir = c(Bobot_2024/ResponseRate,
                  Bobot_2025/ResponseRate)
)

print(hasil)
```

#### Keterangan
- `1/Pi` digunakan untuk menghitung bobot dasar (inverse probability).
- `ifelse()` digunakan untuk memberikan bobot sesuai angkatan.
- `nrow()` digunakan untuk menghitung jumlah responden.
- `ResponseRate` digunakan untuk menghitung tingkat respon.
- `data.frame()` digunakan untuk membuat tabel hasil bobot.
- `print()` digunakan untuk menampilkan hasil bobot sampling.

#### 7. Pembuatan Desain Survei

Tahap ini bertujuan untuk membentuk desain survei sesuai dengan metode *Two Stage Cluster Sampling*. Desain survei dibangun dengan memasukkan informasi *cluster* dan bobot akhir setiap responden sehingga proses estimasi dapat memperhitungkan desain pengambilan sampel yang digunakan.

#### Syntax
```r
library(survey)
library(ggplot2)

sampel$Kategori <- cut(
  sampel$TOTAL,
  breaks = c(10, 23.33, 36.67, 50),
  labels = c("Rendah","Sedang","Tinggi"),
  include.lowest = TRUE
)

design_cluster <- svydesign(
  id = ~ANGKATAN,
  weights = ~Bobot_Akhir,
  data = sampel
)

print(design_cluster)
```

#### Keterangan
- `cut()` digunakan untuk mengelompokkan skor menjadi kategori.
- `svydesign()` digunakan untuk membentuk desain survei berbobot.
- `id` digunakan untuk variabel cluster.
- `weights` digunakan untuk bobot sampling akhir.
- `print()` digunakan untuk menampilkan desain survei.

#### 8. Estimasi Tingkat Penggunaan E-Wallet

Tahap ini bertujuan untuk mengestimasi tingkat penggunaan *e-wallet* berdasarkan data sampel yang telah diberikan bobot. Estimasi dilakukan menggunakan desain survei sehingga hasil yang diperoleh dapat mewakili kondisi populasi.

#### Syntax
```r
table(sampel$Kategori)

svytable(~Kategori, design_cluster)

proporsi <- prop.table(
  svytable(~Kategori, design_cluster)
) * 100

mean_total <- svymean(
  ~TOTAL,
  design_cluster
)
```

#### Keterangan
- `table()` digunakan untuk frekuensi kategori.
- `svytable()` digunakan untuk tabel berbobot.
- `prop.table()` digunakan untuk menghitung proporsi.
- `svymean()` digunakan untuk menghitung rata-rata berbobot.

#### 9. Analisis Kualitas Estimasi

Tahap ini bertujuan untuk mengevaluasi ketelitian hasil estimasi yang diperoleh. Ukuran yang digunakan meliputi *Standard Error* (SE), *Confidence Interval* (CI), *Relative Standard Error* (RSE), dan *Design Effect* (DEFF).

#### Syntax
```r
SE(mean_total)

confint(mean_total)

RSE <- (SE(mean_total)/coef(mean_total))*100

svymean(
  ~TOTAL,
  design_cluster,
  deff = TRUE
)

svyby(
  ~TOTAL,
  ~ANGKATAN,
  design_cluster,
  svymean
)
```

#### Keterangan
- `SE()` digunakan untuk menghitung standard error.
- `confint()` digunakan untuk interval kepercayaan.
- `RSE` digunakan untuk relative standard error.
- `deff = TRUE` digunakan untuk design effect.
- `svyby()` digunakan untuk estimasi berdasarkan kelompok.

#### 10. Visualisasi Data

Tahap ini bertujuan untuk menyajikan hasil analisis dalam bentuk visual sehingga distribusi data dan hasil estimasi dapat dipahami dengan lebih mudah. Visualisasi dilakukan menggunakan package `ggplot2` dalam bentuk diagram batang, histogram, diagram lingkaran, maupun grafik lain yang sesuai dengan kebutuhan analisis.

#### Visualisasi 1 - Rata-rata Skor Setiap Pernyataan
#### Syntax
```r
library(ggplot2)

item <- paste0("P", 1:10)

rata_item <- colMeans(sampel[item], na.rm = TRUE)

df_item <- data.frame(
  Pertanyaan = factor(item, levels = item),
  Rata_rata = rata_item
)

ggplot(df_item,
       aes(x = Pertanyaan,
           y = Rata_rata)) +
  
  geom_col(fill = "steelblue",
           width = 0.7) +
  
  geom_text(aes(label = round(Rata_rata,2)),
            vjust = -0.4,
            size = 5) +
  
  ylim(0,5) +
  
  labs(
    title = "Rata-rata Skor Setiap Pernyataan",
    subtitle = "Penggunaan E-Wallet Mahasiswa Program Studi Statistika",
    x = "Item Pernyataan",
    y = "Rata-rata Skor"
  ) +
  
  theme_minimal(base_size = 14)
```

#### Keterangan
- `ggplot()` digunakan untuk membuat objek grafik.
- `item <- paste0("P", 1:10)` digunakan untuk membuat nama variabel P1 sampai P10.
- `colMeans()` digunakan untuk menghitung rata-rata setiap item pertanyaan.
- `data.frame()` digunakan untuk menyusun data sebelum divisualisasikan.
- `aes()` digunakan untuk memetakan variabel ke sumbu X dan Y.
- `geom_col()` digunakan untuk membuat diagram batang.
- `geom_text()` digunakan untuk menampilkan nilai di atas batang.
- `round()` digunakan untuk membulatkan nilai rata-rata.
- `ylim()` digunakan untuk mengatur batas sumbu Y.
- `labs()` digunakan untuk memberi judul dan label grafik.
- `theme_minimal()` digunakan untuk tampilan grafik yang sederhana.

#### Visualisasi 2 - Estimasi Tingkat Penggunaan E-Wallet
#### Syntax
```r
estimasi_plot <- data.frame(
  Kategori = names(proporsi),
  Persentase = as.numeric(proporsi)
)

ggplot(estimasi_plot,
       aes(x = Kategori,
           y = Persentase,
           fill = Kategori)) +
  
  geom_col(width = 0.7) +
  
  geom_text(aes(label = paste0(round(Persentase,1),"%")),
            vjust = -0.4,
            size = 5) +
  
  labs(
    title = "Estimasi Tingkat Penggunaan E-Wallet",
    subtitle = "Mahasiswa Program Studi Statistika Universitas Mataram",
    x = "Kategori",
    y = "Persentase (%)"
  ) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    legend.position = "none"
  )
```

#### Keterangan
- `data.frame()` digunakan untuk membuat dataset visualisasi.
- `names(proporsi)` digunakan untuk mengambil nama kategori hasil estimasi.
- `as.numeric()` digunakan untuk mengubah data menjadi numerik.
- `ggplot()` digunakan untuk membuat grafik.
- `aes()` digunakan untuk mapping variabel.
- `geom_col()` digunakan untuk diagram batang.
- `geom_text()` digunakan untuk menampilkan persentase.
- `paste0()` digunakan untuk menambahkan simbol persen (%).
- `round()` digunakan untuk pembulatan nilai.
- `theme_minimal()` digunakan untuk tampilan grafik sederhana.
- `legend.position = "none"` digunakan untuk menghilangkan legenda.

#### Visualisasi 3 - Rata-rata Skor Berdasarkan Angkatan

#### Syntax
```r
rata_angkatan <- svyby(
  ~TOTAL,
  ~ANGKATAN,
  design_cluster,
  svymean
)

ggplot(rata_angkatan,
       aes(x = factor(ANGKATAN),
           y = TOTAL,
           fill = factor(ANGKATAN))) +
  
  geom_col(width = 0.6) +
  
  geom_text(aes(label = round(TOTAL,2)),
            vjust = -0.4,
            size = 5) +
  
  labs(
    title = "Estimasi Rata-rata Skor Penggunaan E-Wallet",
    subtitle = "Berdasarkan Angkatan",
    x = "Angkatan",
    y = "Estimasi Rata-rata Skor"
  ) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    legend.position = "none"
  )
```

#### Keterangan
- `svyby()` digunakan untuk menghitung rata-rata berdasarkan kelompok (Angkatan).
- `svymean()` digunakan untuk menghitung rata-rata berbobot.
- `factor()` digunakan untuk mengubah variabel menjadi kategori.
- `ggplot()` digunakan untuk membuat grafik.
- `geom_col()` digunakan untuk diagram batang.
- `geom_text()` digunakan untuk menampilkan nilai pada grafik.
- `round()` digunakan untuk pembulatan nilai.
- `theme_minimal()` digunakan untuk tampilan grafik sederhana.

#### Visualisasi 4 - Diagram Lingkaran Estimasi Penggunaan E-Wallet
##### Syntax
```r
ggplot(estimasi_plot,
       aes(x = "",
           y = Persentase,
           fill = Kategori)) +
  
  geom_col(width = 1,
           color = "white") +
  
  coord_polar("y") +
  
  geom_text(aes(label = paste0(round(Persentase,1),"%")),
            position = position_stack(vjust = 0.5),
            size = 5) +
  
  labs(
    title = "Estimasi Tingkat Penggunaan E-Wallet"
  ) +
  
  theme_void()
```

#### Keterangan
- `ggplot()` digunakan untuk membuat grafik.
- `aes()` digunakan untuk mapping variabel ke grafik.
- `geom_col()` digunakan untuk membuat diagram batang sebelum diubah menjadi pie chart.
- `coord_polar()` digunakan untuk mengubah diagram batang menjadi diagram lingkaran.
- `geom_text()` digunakan untuk menampilkan persentase pada diagram.
- `round()` digunakan untuk membulatkan nilai.
- `paste0()` digunakan untuk menambahkan simbol persen (%).
- `position_stack()` digunakan untuk mengatur posisi teks dalam diagram.
- `theme_void()` digunakan untuk menghilangkan background grafik.

---

## Daftar Pustaka
- Rachmad, Y. E., Bakri, A. A., Nuraini, R., Nurdiani, T. W., & Kushariyadi. (2024). Application of The Unified Theory of Acceptance and Use of Technology Method to Analyze Factors Influencing The Use of Digital Wallets in Indonesia. _Jurnal Informasi dan Teknologi, 6_(1), 229-234. DOI: https://doi.org/10.60083/jidt.v6i1.504
- Mawardi, A. I., & Sholihah, D. D. (2021). Gambaran _Technology Acceptance_ Model Mahasiswa pada _Financial Technology_ (E-Wallet). _Jurnal MEBIS (Manajemen dan Bisnis), 6_(1), 1-6. DOI: https://doi.org/10.33005/mebis.v6i1.222
- Nugroho, A., & Pramudita, K. (2023). Determinan Penggunaan E-Wallet di Kalangan Mahasiswa Yogyakarta. _Asian Journal of Innovation and Entrepreneurship, 7_(2), 39-46. DOI: https://doi.org/10.20885/ajie.vol7.iss2.art1
- Rachmawati, D. A., & Trisnaningsih, S. (2023). Pengaruh Efektivitas, Manfaat dan Gaya Hidup terhadap Minat Penggunaan E-Wallet pada Kalangan Mahasiswa Akuntansi UPN "Veteran" Jawa Timur dengan Pendekatan _Technology Acceptance Model_. _Al-Kharaj: Jurnal Ekonomi, Keuangan & Bisnis Syariah, 5_(5), 2730-2740. DOI: https://doi.org/10.47467/alkharaj.v5i5.4267
- Khofifah, S., & Kardiyem. (2024). Intensitas Penggunaan E-Wallet pada Mahasiswa Fakultas Ekonomika dan Bisnis: Perspektif Teori TAM dan UTAUT. _Jurnal Ekonomi dan Pendidikan, 20_(2), 62-78. DOI: https://doi.org/10.21831/jep.v20i2.63121
