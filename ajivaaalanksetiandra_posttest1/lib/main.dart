import 'package:flutter/material.dart';

void main() {
  runApp(const MBriggsTester());
}

// MaterialApp: widget utama yang membungkus seluruh aplikasi
class MBriggsTester extends StatelessWidget {
  const MBriggsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menentukan nama aplikasi
      title: 'M-Briggs Tester',

      // Menghilangkan tulisan DEBUG di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Mengatur tema visual aplikasi
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF54A6A2),
        ),
      ),

      // Menentukan halaman pertama aplikasi
      home: const HomePage(),
    );
  }
}

// Halaman Home M-Briggs Tester
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna background halaman
      backgroundColor: const Color(0xFFF5F8F7),

      // AppBar sebagai bagian atas halaman
      appBar: AppBar(
        backgroundColor: const Color(0xFF54A6A2),
        elevation: 0,

        // Row untuk menyusun icon dan nama aplikasi secara horizontal
        title: Row(
          children: [
            // Icon untuk logo aplikasi
            const Icon(
              Icons.psychology,
              color: Colors.white,
              size: 28,
            ),

            // SizedBox untuk memberikan jarak antara icon dan text
            const SizedBox(width: 10),

            // Text untuk nama aplikasi
            const Text(
              'M-Briggs Tester',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // SafeArea memastikan konten tidak tertutup area perangkat
      body: SafeArea(

        // SingleChildScrollView membuat halaman dapat di-scroll
        child: SingleChildScrollView(

          // Padding memberikan jarak antara isi dengan tepi layar
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Column menyusun seluruh konten secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Container untuk banner utama aplikasi
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),

                  // BoxDecoration mengatur warna, radius, dan tampilan container
                  decoration: BoxDecoration(
                    color: const Color(0xFF54A6A2),
                    borderRadius: BorderRadius.circular(22),
                  ),

                  // Column menyusun isi banner secara vertikal
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Icon sebagai ilustrasi psikologi
                      const Icon(
                        Icons.psychology_alt,
                        color: Colors.white,
                        size: 48,
                      ),

                      // SizedBox memberikan jarak
                      const SizedBox(height: 16),

                      // Text untuk judul utama
                      const Text(
                        'Kenali Dirimu\nLebih Dalam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // SizedBox memberikan jarak
                      const SizedBox(height: 12),

                      // Text untuk deskripsi aplikasi
                      const Text(
                        'Temukan tipe kepribadian MBTI kamu '
                        'dan pahami karakter serta potensi dirimu.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // SizedBox memberikan jarak antar section
                const SizedBox(height: 25),

                // Text untuk judul pencarian
                const Text(
                  'Cari Tipe Kepribadian',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263A3A),
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 12),

                // TextField sebagai input pencarian
                TextField(
                  decoration: InputDecoration(
                    // Placeholder pada TextField
                    hintText: 'Cari tipe MBTI, contoh: INFP',

                    // Icon pencarian di bagian kanan TextField
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12),

                      // Icon untuk pencarian
                      child: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.grey.shade400,
                      ),
                    ),

                    // Mengatur tampilan TextField
                    filled: true,
                    fillColor: Colors.white,

                    // Border TextField
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 28),

                // Row untuk judul section dan tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Text judul section
                    const Text(
                      'Tipe Kepribadian',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263A3A),
                      ),
                    ),

                    // Text untuk melihat semua tipe
                    const Text(
                      '16 Tipe',
                      style: TextStyle(
                        color: Color(0xFF54A6A2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 15),

                // Row untuk dua kartu MBTI
                Row(
                  children: [

                    // Expanded membuat card mengisi ruang yang tersedia
                    Expanded(
                      child: _mbtiCard(
                        'INTJ',
                        'The Architect',
                        Icons.architecture,
                      ),
                    ),

                    // SizedBox memberikan jarak horizontal
                    const SizedBox(width: 12),

                    // Expanded untuk kartu kedua
                    Expanded(
                      child: _mbtiCard(
                        'ENFP',
                        'The Campaigner',
                        Icons.auto_awesome,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 12),

                // Row untuk dua kartu MBTI berikutnya
                Row(
                  children: [

                    // Expanded untuk kartu INFJ
                    Expanded(
                      child: _mbtiCard(
                        'INFJ',
                        'The Advocate',
                        Icons.favorite_outline,
                      ),
                    ),

                    // SizedBox memberikan jarak horizontal
                    const SizedBox(width: 12),

                    // Expanded untuk kartu ENTP
                    Expanded(
                      child: _mbtiCard(
                        'ENTP',
                        'The Debater',
                        Icons.forum_outlined,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 28),

                // Container untuk informasi tentang MBTI
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  // BoxDecoration untuk mengatur tampilan container
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFFD7E5E3),
                    ),
                  ),

                  // Row untuk icon dan informasi
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Icon informasi
                      const Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFF54A6A2),
                        size: 30,
                      ),

                      // SizedBox memberikan jarak
                      const SizedBox(width: 14),

                      // Expanded agar Text menggunakan sisa ruang
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Text judul informasi
                            Text(
                              'Apa itu MBTI?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // SizedBox memberikan jarak
                            SizedBox(height: 8),

                            // Text penjelasan MBTI
                            Text(
                              'MBTI adalah metode untuk mengenali '
                              'preferensi kepribadian seseorang melalui '
                              '16 tipe kepribadian.',
                              style: TextStyle(
                                color: Colors.black54,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // SizedBox memberikan jarak bawah
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Container custom untuk menampilkan tipe MBTI
  Widget _mbtiCard(
    String type,
    String description,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),

      // BoxDecoration untuk mengatur tampilan kartu
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFD7E5E3),
        ),
      ),

      // Column menyusun icon dan text secara vertikal
      child: Column(
        children: [

          // Icon untuk tipe kepribadian
          Icon(
            icon,
            color: const Color(0xFF54A6A2),
            size: 32,
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 10),

          // Text untuk kode MBTI
          Text(
            type,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263A3A),
            ),
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 4),

          // Text untuk nama tipe MBTI
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}