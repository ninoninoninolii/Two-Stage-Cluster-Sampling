#=========================================================
# UJI VALIDITAS DAN RELIABILITAS
#=========================================================

library(readxl)
library(psych)

#=========================================================
# IMPORT DATA
#=========================================================

data <- read_excel("C:/Users/HP/Documents/RESPONDEN.xlsx")
View(data)

#=========================================================
# ITEM PERTANYAAN
#=========================================================

item <- c("P1","P2","P3","P4","P5",
          "P6","P7","P8","P9","P10")

#=========================================================
# MENGUBAH DATA MENJADI NUMERIC
#=========================================================

data[item] <- lapply(data[item],
                     function(x) as.numeric(as.character(x)))

#=========================================================
# MENGHITUNG SKOR TOTAL
#=========================================================

data$TOTAL <- rowSums(data[item],
                      na.rm = TRUE)

#=========================================================
# MEMBUAT DATAFRAME HASIL VALIDITAS
#=========================================================

hasil_validitas <- data.frame(
  
  Item = character(),
  
  r_hitung = numeric(),
  
  p_value = numeric(),
  
  Keputusan = character()
  
)

#=========================================================
# UJI VALIDITAS
#=========================================================

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

#=========================================================
# NILAI r TABEL
#=========================================================

r_tabel <- 0.361

#=========================================================
# KEPUTUSAN VALIDITAS
#=========================================================

hasil_validitas$Keputusan <- ifelse(
  hasil_validitas$r_hitung > r_tabel,
  "Valid",
  "Tidak Valid"
)

print(hasil_validitas)

#=========================================================
# UJI RELIABILITAS
#=========================================================

hasil_alpha <- alpha(data[item])

print(hasil_alpha)

#=========================================================
# NILAI CRONBACH'S ALPHA
#=========================================================

cat("Cronbach's Alpha =",
    round(hasil_alpha$total$raw_alpha,3),"/n")

if(hasil_alpha$total$raw_alpha >= 0.70){
  
  cat("Keputusan : Instrumen Reliabel")
  
}else{
  
  cat("Keputusan : Instrumen Tidak Reliabel")
  
}

#=========================================================
# CODINGAN ANALISIS LANJUTAN
#=========================================================

#=========================================================
# MEMANGGIL PACKAGE
#=========================================================

library(readxl)
library(survey)

#=========================================================
# IMPORT DATA
#=========================================================

populasi <- read_excel("C:/Users/HP/Documents/POPULASII.xlsx")

sampel <- read_excel("C:/Users/HP/Documents/SAMPEL.xlsx")

View(populasi)
View(sampel)

#=========================================================
# MENYAMAKAN NAMA KOLOM
#=========================================================

names(populasi)[names(populasi)=="Angkatan"] <- "ANGKATAN"

#=========================================================
# ITEM PERTANYAAN
#=========================================================

item <- c("P1","P2","P3","P4","P5",
          "P6","P7","P8","P9","P10")

#=========================================================
# UBAH KE NUMERIC
#=========================================================

sampel[item] <- lapply(sampel[item],
                       function(x) as.numeric(as.character(x)))

#=========================================================
# HITUNG SKOR TOTAL
#=========================================================

sampel$TOTAL <- rowSums(sampel[item],
                        na.rm = TRUE)

#=========================================================
# HITUNG RATA-RATA SKOR PENGGUNAAN E-WALLET
#=========================================================

sampel$Rata_EWallet <- rowMeans(sampel[item],
                                na.rm = TRUE)

cat("Rata-rata Skor Penggunaan E-Wallet =",
    round(mean(sampel$Rata_EWallet),2), "\n")

#=========================================================
# STATISTIK DESKRIPTIF
#=========================================================

summary(sampel$TOTAL)

cat("Rata-rata =",
    round(mean(sampel$TOTAL),2), "\n")

cat("Standar Deviasi =",
    round(sd(sampel$TOTAL),2), "\n")

cat("Minimum =",
    min(sampel$TOTAL), "\n")

cat("Maksimum =",
    max(sampel$TOTAL), "\n")

#=========================================================
# CEK JUMLAH POPULASI DAN SAMPEL
#=========================================================

table(populasi$ANGKATAN)

table(sampel$ANGKATAN)

#=========================================================
# INFORMASI SAMPLING
#=========================================================

# Tahap 1
M <- 6      # Jumlah seluruh cluster

m <- 2      # Cluster yang dipilih

# Tahap 2
N2024 <- sum(populasi$ANGKATAN == 2024)

N2025 <- sum(populasi$ANGKATAN == 2025)

n2024 <- sum(sampel$ANGKATAN == 2024)

n2025 <- sum(sampel$ANGKATAN == 2025)

cat("Jumlah Populasi 2024 =", N2024, "\n")

cat("Jumlah Populasi 2025 =", N2025, "\n")

cat("Jumlah Sampel 2024 =", n2024, "\n")

cat("Jumlah Sampel 2025 =", n2025, "\n")

#=========================================================
# HITUNG PELUANG TAHAP 1
#=========================================================

P1 <- m/M

#=========================================================
# HITUNG PELUANG TAHAP 2
#=========================================================

P2_2024 <- n2024/N2024

P2_2025 <- n2025/N2025

#=========================================================
# HITUNG PELUANG TOTAL
#=========================================================

Pi_2024 <- P1 * P2_2024

Pi_2025 <- P1 * P2_2025

cat("Peluang 2024 =", Pi_2024, "\n")

cat("Peluang 2025 =", Pi_2025, "\n")

#=========================================================
# HITUNG BOBOT DASAR
#=========================================================

Bobot_2024 <- 1/Pi_2024

Bobot_2025 <- 1/Pi_2025

cat("Bobot 2024 =", Bobot_2024, "\n")

cat("Bobot 2025 =", Bobot_2025, "\n")

#=========================================================
# MEMASUKKAN BOBOT KE DATA SAMPEL
#=========================================================

sampel$Bobot <- ifelse(sampel$ANGKATAN == 2024,
                       Bobot_2024,
                       Bobot_2025)

#=========================================================
# RESPONSE RATE
#=========================================================

Target <- 30

Responden <- nrow(sampel)

ResponseRate <- Responden/Target

cat("Response Rate =",
    round(ResponseRate,2), "\n")

#=========================================================
# BOBOT AKHIR
#=========================================================

sampel$Bobot_Akhir <- sampel$Bobot/ResponseRate

#=========================================================
# TABEL HASIL
#=========================================================

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

#=========================================================
# ESTIMASI TINGKAT PENGGUNAAN E-WALLET
#=========================================================

library(survey)
library(ggplot2)

#=========================================================
# MEMBUAT KATEGORI TINGKAT PENGGUNAAN E-WALLET
#=========================================================

sampel$Kategori <- cut(
  sampel$TOTAL,
  breaks = c(10, 23.33, 36.67, 50),
  labels = c("Rendah",
             "Sedang",
             "Tinggi"),
  include.lowest = TRUE
)

#=========================================================
# MEMBUAT DESAIN SURVEI
#=========================================================

design_cluster <- svydesign(
  id = ~ANGKATAN,
  weights = ~Bobot_Akhir,
  data = sampel
)

print(design_cluster)

#=========================================================
# FREKUENSI KATEGORI
#=========================================================

table(sampel$Kategori)

#=========================================================
# ESTIMASI JUMLAH TERBOBOT
#=========================================================

svytable(~Kategori, design_cluster)

#=========================================================
# ESTIMASI PROPORSI TERBOBOT
#=========================================================

proporsi <- prop.table(
  svytable(~Kategori, design_cluster)
) * 100

round(proporsi, 2)

#=========================================================
# ESTIMASI RATA-RATA SKOR
#=========================================================

mean_total <- svymean(
  ~TOTAL,
  design_cluster
)

mean_total

#=========================================================
# STANDARD ERROR
#=========================================================

SE(mean_total)

#=========================================================
# CONFIDENCE INTERVAL 95%
#=========================================================

confint(mean_total)

#=========================================================
# RELATIVE STANDARD ERROR
#=========================================================

RSE <- (SE(mean_total)/coef(mean_total))*100

cat("Nilai RSE =", round(RSE,2), "%\n")

if(RSE < 25){
  cat("Keputusan : Estimasi Layak (RSE < 25%)\n")
}else{
  cat("Keputusan : Estimasi Kurang Layak (RSE ≥ 25%)\n")
}

#=========================================================
# DESIGN EFFECT
#=========================================================

svymean(
  ~TOTAL,
  design_cluster,
  deff = TRUE
)

#=========================================================
# RATA-RATA SKOR BERDASARKAN ANGKATAN
#=========================================================

svyby(
  ~TOTAL,
  ~ANGKATAN,
  design_cluster,
  svymean
)

#=========================================================
# STATISTIK DESKRIPTIF
#=========================================================

summary(sampel$TOTAL)

cat("Rata-rata =", round(mean(sampel$TOTAL),2), "\n")
cat("Standar Deviasi =", round(sd(sampel$TOTAL),2), "\n")
cat("Minimum =", min(sampel$TOTAL), "\n")
cat("Maksimum =", max(sampel$TOTAL), "\n")

#=========================================================
# VISUALISASI HASIL PENELITIAN
#=========================================================

library(ggplot2)

#=========================================================
# VISUALISASI 1
# DIAGRAM BATANG RATA-RATA SETIAP PERTANYAAN
#=========================================================

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

#=========================================================
# VISUALISASI 2
# DIAGRAM BATANG ESTIMASI TINGKAT PENGGUNAAN E-WALLET
#=========================================================

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

#=========================================================
# VISUALISASI 3
# DIAGRAM BATANG ESTIMASI RATA-RATA BERDASARKAN ANGKATAN
#=========================================================

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

#=========================================================
# VISUALISASI 4
# DIAGRAM LINGKARAN ESTIMASI TINGKAT PENGGUNAAN E-WALLET
#=========================================================

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