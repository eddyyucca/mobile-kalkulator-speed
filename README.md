# Kalkulator Speed BUMA IPR

**Kalkulator Speed BUMA IPR** adalah aplikasi Flutter yang dirancang untuk membantu perhitungan operasional di lapangan, khususnya dalam menghitung kecepatan, efisiensi pengangkutan, dan jumlah truk yang diperlukan berdasarkan berbagai parameter.

## Fitur Utama

1. **Pemilihan Tipe Hauler**

   - Mendukung berbagai tipe hauler seperti CAT 789, CAT 785, dan CAT 777.

2. **Input Parameter Operasional**

   - **Jarak (km)**
   - **Speed Plan (km/h)**
   - **Fix Time (menit)**
   - **Qty Truck Aktual**

3. **Hasil Perhitungan**

   - Menampilkan hasil perhitungan termasuk:
     - Jarak total
     - Rencana kecepatan
     - Faktor Muat (MF)
     - Jumlah truk yang dibutuhkan
     - Kecepatan seharusnya

4. **Navigasi Intuitif**

   - Menggunakan navigasi bar bawah untuk akses cepat ke fitur "Hitung" dan "Hitung Aktual".

5. **Tampilan yang Responsif**
   - Antarmuka pengguna yang bersih dan mudah digunakan dengan dukungan gambar logo perusahaan.

## Cara Instalasi

1. Pastikan Anda memiliki Flutter terinstal di komputer Anda.

   - Untuk instalasi Flutter, kunjungi: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. Clone repositori ini:

   ```bash
   git clone https://github.com/your-repo/kalkulatorspeed.git
   ```

3. Masuk ke direktori proyek:

   ```bash
   cd kalkulatorspeed
   ```

4. Jalankan perintah berikut untuk mengunduh dependencies:

   ```bash
   flutter pub get
   ```

5. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Struktur Direktori

```
.
├── assets
│   └── img
│       └── logo_buma_tabang.png
├── lib
│   ├── main.dart
└── pubspec.yaml
```

## Dependensi Utama

- **Flutter SDK**
- **cupertino_icons**: ^1.0.8
- **url_launcher**: ^6.1.10

## Kontribusi

Kami menyambut kontribusi untuk pengembangan lebih lanjut aplikasi ini. Jika Anda ingin berkontribusi:

1. Fork repositori ini.
2. Buat branch baru untuk fitur Anda:
   ```bash
   git checkout -b fitur-baru
   ```
3. Commit perubahan Anda:
   ```bash
   git commit -m "Menambahkan fitur baru"
   ```
4. Push branch Anda:
   ```bash
   git push origin fitur-baru
   ```
5. Ajukan Pull Request.

## Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).

---

**Kontak**  
Jika ada pertanyaan lebih lanjut, silakan hubungi: [Eddy Adha Saputra](mailto:eddyyucca@gmail.com).
