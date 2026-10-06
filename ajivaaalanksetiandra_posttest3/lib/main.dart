import 'package:flutter/material.dart';

void main() {
  runApp(const MBriggsTester());
}

// MAIN APP
class MBriggsTester extends StatelessWidget {
  const MBriggsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M-Briggs Tester',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF54A6A2),
        ),
      ),

      home: const HomePage(),
    );
  }
}

// HOME PAGE - STATEFUL WIDGET
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // State untuk menyimpan teks pencarian
  String searchText = '';

  // Data tipe MBTI
  final List<Map<String, dynamic>> mbtiList = [
    {
      'type': 'INTJ',
      'description': 'The Architect',
      'icon': Icons.architecture,
    },
    {
      'type': 'ENFP',
      'description': 'The Campaigner',
      'icon': Icons.auto_awesome,
    },
    {
      'type': 'INFJ',
      'description': 'The Advocate',
      'icon': Icons.favorite_outline,
    },
    {
      'type': 'ENTP',
      'description': 'The Debater',
      'icon': Icons.forum_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {

    // Filter data berdasarkan pencarian
    final filteredList = mbtiList.where((mbti) {

      final type = mbti['type'].toString().toUpperCase();
      final description =
          mbti['description'].toString().toUpperCase();

      final search = searchText.toUpperCase();

      return type.contains(search) ||
          description.contains(search);

    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF54A6A2),
        elevation: 0,

        title: Row(
          children: [

            const Icon(
              Icons.psychology,
              color: Colors.white,
              size: 28,
            ),

            const SizedBox(width: 10),

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

      // BODY
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // BANNER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: const Color(0xFF54A6A2),
                    borderRadius: BorderRadius.circular(22),

                    // BOX SHADOW
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Icon(
                        Icons.psychology_alt,
                        color: Colors.white,
                        size: 48,
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Kenali Dirimu\nLebih Dalam',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

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

                const SizedBox(height: 25),
                // SEARCH
                const Text(
                  'Cari Tipe Kepribadian',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263A3A),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(

                  // STATEFUL WIDGET
                  // setState digunakan ketika input berubah
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },

                  decoration: InputDecoration(
                    hintText: 'Cari tipe MBTI, contoh: INFP',

                    suffixIcon: const Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.grey,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // TITLE
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      'Tipe Kepribadian',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263A3A),
                      ),
                    ),

                    Text(
                      '${filteredList.length} Tipe',
                      style: const TextStyle(
                        color: Color(0xFF54A6A2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // MBTI CARD
                if (filteredList.isEmpty)

                  // Pesan ketika tidak ada hasil pencarian
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: const Column(
                      children: [

                        Icon(
                          Icons.search_off,
                          size: 45,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Tipe MBTI tidak ditemukan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )

                else

                  // Grid sederhana untuk card MBTI
                  GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),

                    itemCount: filteredList.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.95,
                    ),

                    itemBuilder: (context, index) {

                      final mbti = filteredList[index];

                      return _mbtiCard(
                        context,
                        mbti['type'],
                        mbti['description'],
                        mbti['icon'],
                      );
                    },
                  ),

                const SizedBox(height: 28),

                // ======================================================
                // INFORMATION
                // ======================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),

                    border: Border.all(
                      color: const Color(0xFFD7E5E3),
                    ),

                    // BOX SHADOW
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      const Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFF54A6A2),
                        size: 30,
                      ),

                      const SizedBox(width: 14),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Apa itu MBTI?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

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

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // MBTI CARD
  Widget _mbtiCard(
    BuildContext context,
    String type,
    String description,
    IconData icon,
  ) {
    return GestureDetector(

      // NAVIGATION PUSH
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MBTIDetailPage(
              type: type,
              description: description,
              icon: icon,
            ),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: const Color(0xFFD7E5E3),
          ),

          // BOX SHADOW
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              color: const Color(0xFF54A6A2),
              size: 32,
            ),

            const SizedBox(height: 10),

            Text(
              type,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263A3A),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Lihat detail',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF54A6A2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DETAIL PAGE
class MBTIDetailPage extends StatelessWidget {

  final String type;
  final String description;
  final IconData icon;

  const MBTIDetailPage({
    super.key,
    required this.type,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F7),

      appBar: AppBar(
        backgroundColor: const Color(0xFF54A6A2),
        foregroundColor: Colors.white,

        title: Text(
          '$type - Detail',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // STACK
            SizedBox(
              height: 280,

              child: Stack(
                children: [

                  // IMAGE
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,

                    child: Image.network(
                      'https://images.unsplash.com/'
                      'photo-1559757175-0eb30cd8c063'
                      '?auto=format&fit=crop&w=1000&q=80',

                      height: 280,
                      width: double.infinity,

                      // IMAGE
                      fit: BoxFit.cover,
                    ),
                  ),

                  // IMAGE OVERLAY
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,

                    child: Container(
                      color: Colors.black.withOpacity(0.35),
                    ),
                  ),

                  // CONTENT DI ATAS IMAGE
                  Positioned(
                    left: 25,
                    bottom: 25,

                    child: Row(
                      children: [

                        // ICON CONTAINER + BOX SHADOW
                        Container(
                          width: 65,
                          height: 65,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(18),

                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),

                          child: Icon(
                            icon,
                            color:
                                const Color(0xFF54A6A2),
                            size: 35,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              type,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // DETAIL
            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          'Tentang $type',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF263A3A),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          '$type atau $description merupakan salah '
                          'satu tipe kepribadian dalam MBTI. Tipe ini '
                          'memiliki karakteristik dan preferensi yang '
                          'unik dalam cara berpikir, berinteraksi, '
                          'dan mengambil keputusan.',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F3F1),
                      borderRadius:
                          BorderRadius.circular(18),
                    ),

                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          'Karakteristik',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF263A3A),
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          '• Memiliki pola pikir yang khas\n'
                          '• Memiliki preferensi dalam berinteraksi\n'
                          '• Memiliki cara tersendiri dalam mengambil keputusan\n'
                          '• Memiliki potensi dan kekuatan yang berbeda',
                          style: TextStyle(
                            color: Colors.black54,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // NAVIGATION POP
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {

                        // Kembali ke HomePage
                        Navigator.pop(context);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF54A6A2),
                        foregroundColor: Colors.white,

                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 15,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),

                      child: const Text(
                        'Kembali',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}