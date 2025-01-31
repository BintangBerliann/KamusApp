import 'package:flutter/material.dart';
import 'about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedLetter = 'A'; // Default huruf A
  String displayText = 'Awalan A';
  String displayText2 = 'Noun A';
  String displayText3 = 'A means ...';
  String searchQuery = '';

final Map<String, Map<String, String>> dictionary = {
  'A': {
    'Ais': 'Air yang digunakan untuk minum atau memasak.',
    'Ambe': 'Pergi atau berangkat ke suatu tempat.',
    'Aro': 'Matahari yang memberikan cahaya dan kehangatan.',
  },
  'B': {
    'Babi': 'Hewan berkaki empat yang sering dijadikan hewan ternak.',
    'Batu': 'Benda keras yang berasal dari alam, sering digunakan untuk bangunan.',
    'Buka': 'Membuka sesuatu, seperti pintu atau bungkusan.',
  },
  'C': {
    'Cakalele': 'Tarian perang tradisional dari Maluku.',
    'Cincin': 'Perhiasan yang dipakai di jari.',
    'Cucu': 'Anak dari anak kita.',
  },
  'D': {
    'Dabu': 'Tanah yang digunakan untuk bercocok tanam.',
    'Daging': 'Bagian tubuh hewan yang dimakan sebagai sumber protein.',
    'Duri': 'Bagian tajam pada tumbuhan yang berfungsi sebagai pelindung.',
  },
  'E': {
    'Esa': 'Satu atau tunggal, sering digunakan dalam konteks keagamaan.',
    'Emas': 'Logam mulia yang berharga dan sering dijadikan perhiasan.',
    'Ekor': 'Bagian belakang tubuh hewan yang panjang dan fleksibel.',
  },
  'F': {
    'Fajar': 'Waktu di pagi hari ketika matahari mulai terbit.',
    'Fas': 'Cepat atau gesit dalam melakukan sesuatu.',
    'Fungsi': 'Kegunaan atau peran dari suatu benda atau konsep.',
  },
  'G': {
    'Gajah': 'Hewan besar berkaki empat dengan belalai panjang.',
    'Gunung': 'Dataran tinggi yang menjulang di atas permukaan bumi.',
    'Gula': 'Bahan pemanis yang terbuat dari tebu atau aren.',
  },
  'H': {
    'Hutan': 'Area luas yang ditumbuhi banyak pohon dan tanaman.',
    'Hujan': 'Air yang jatuh dari awan ke bumi.',
    'Hati': 'Organ tubuh yang berfungsi untuk menyaring darah.',
  },
  'I': {
    'Ikan': 'Hewan air yang bernapas dengan insang.',
    'Ibu': 'Wanita yang melahirkan dan merawat anaknya.',
    'Itik': 'Unggas yang sering dipelihara untuk diambil daging dan telurnya.',
  },
  'J': {
    'Jalan': 'Tempat untuk berlalu lintas, baik untuk kendaraan maupun pejalan kaki.',
    'Jagung': 'Tanaman pangan yang bijinya bisa dimakan.',
    'Jaring': 'Alat untuk menangkap ikan atau hewan lainnya.',
  },
  'K': {
    'Kaki': 'Bagian tubuh yang digunakan untuk berjalan.',
    'Kucing': 'Hewan peliharaan yang lucu dan sering dijadikan teman.',
    'Kayu': 'Bahan yang berasal dari pohon, digunakan untuk membuat furniture.',
  },
  'L': {
    'Laut': 'Perairan asin yang luas, menutupi sebagian besar permukaan bumi.',
    'Lampu': 'Alat yang menghasilkan cahaya untuk penerangan.',
    'Lembu': 'Hewan ternak yang sering digunakan untuk membajak sawah.',
  },
  'M': {
    'Mata': 'Organ penglihatan pada manusia dan hewan.',
    'Makan': 'Kegiatan mengonsumsi makanan untuk mendapatkan energi.',
    'Malam': 'Waktu setelah matahari terbenam hingga matahari terbit.',
  },
  'N': {
    'Nasi': 'Makanan pokok yang terbuat dari beras yang dimasak.',
    'Naga': 'Makhluk mitologi yang sering digambarkan sebagai ular besar.',
    'Nenek': 'Ibu dari ayah atau ibu kita.',
  },
  'O': {
    'Orang': 'Makhluk hidup yang memiliki akal dan budi.',
    'Ombak': 'Gelombang air laut yang bergerak karena angin.',
    'Olah': 'Kegiatan untuk melatih tubuh atau pikiran.',
  },
  'P': {
    'Pisang': 'Buah yang memiliki kulit kuning dan daging lembut.',
    'Padi': 'Tanaman pangan yang menghasilkan beras.',
    'Pohon': 'Tumbuhan yang memiliki batang, cabang, dan daun.',
  },
  'Q': {
    'Quota': 'Jumlah atau batas yang ditetapkan untuk sesuatu.',
    'Quran': 'Kitab suci umat Islam.',
    'Quail': 'Burung puyuh yang sering dijadikan buruan.',
  },
  'R': {
    'Rumah': 'Tempat tinggal manusia.',
    'Rusa': 'Hewan berkaki empat dengan tanduk bercabang.',
    'Rantai': 'Barang yang terbuat dari lingkaran logam yang saling terhubung.',
  },
  'S': {
    'Sapi': 'Hewan ternak yang sering diambil susu dan dagingnya.',
    'Sungai': 'Aliran air alami yang mengalir dari hulu ke hilir.',
    'Sagu': 'Makanan pokok yang terbuat dari pohon sagu.',
  },
  'T': {
    'Tangan': 'Bagian tubuh yang digunakan untuk memegang dan melakukan aktivitas.',
    'Tikus': 'Hewan pengerat yang sering dianggap sebagai hama.',
    'Tali': 'Barang yang terbuat dari serat untuk mengikat sesuatu.',
  },
  'U': {
    'Ular': 'Hewan melata yang tidak memiliki kaki.',
    'Uang': 'Alat tukar yang digunakan dalam transaksi ekonomi.',
    'Udara': 'Campuran gas yang menyelimuti bumi dan digunakan untuk bernapas.',
  },
  'V': {
    'Virus': 'Mikroorganisme yang dapat menyebabkan penyakit.',
    'Vokal': 'Huruf yang melambangkan suara dalam bahasa.',
    'Vas': 'Wadah untuk menaruh bunga atau tanaman.',
  },
  'W': {
    'Waktu': 'Ukuran durasi dalam kehidupan sehari-hari.',
    'Wanita': 'Manusia berjenis kelamin perempuan.',
    'Warna': 'Sifat cahaya yang dipantulkan oleh benda.',
  },
  'X': {
    'Xilofon': 'Alat musik yang terdiri dari bilah kayu atau logam.',
    'Xenon': 'Gas mulia yang digunakan dalam lampu dan aplikasi medis.',
    'Xerox': 'Proses menyalin dokumen menggunakan mesin fotokopi.',
  },
  'Y': {
    'Yakin': 'Percaya atau yakin terhadap sesuatu.',
    'Yodium': 'Unsur kimia yang penting untuk kesehatan tiroid.',
    'Yoyo': 'Mainan yang terdiri dari dua cakram dan tali.',
  },
  'Z': {
    'Zebra': 'Hewan berkaki empat dengan garis-garis hitam putih.',
    'Zat': 'Materi yang menyusun suatu benda.',
    'Zaman': 'Periode waktu dalam sejarah atau kehidupan.',
  },
};

  // Fungsi untuk mendapatkan kata yang difilter berdasarkan pencarian atau huruf yang dipilih
  List<MapEntry<String, String>> getFilteredWords() {
    if (searchQuery.isNotEmpty) {
      return dictionary.entries
          .expand((entry) => entry.value.entries)
          .where((entry) => entry.key.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    } else if (selectedLetter.isNotEmpty) {
      return dictionary[selectedLetter]?.entries.toList() ?? [];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Membuka drawer
                },
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png', // Logo aplikasi
                width: 30.0,
                height: 50.0,
              ),
              const SizedBox(width: 10),
              const Text(
                "Panda Dictionary",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 73, 44, 9).withOpacity(0.8),
          elevation: 0.5,
          shadowColor: Colors.grey,
          toolbarHeight: 70.0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 73, 44, 9),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Kembali ke halaman Home
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context); // Tutup drawer
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const AboutPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(-1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.55, 0.55, 1.0],
              colors: [
                Color.fromARGB(255, 73, 44, 9),
                Colors.brown,
                Color.fromARGB(255, 236, 236, 236),
                Color.fromARGB(255, 236, 236, 236),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 130.0),
                  child: Text(
                    "Kamus Indonesia Papua",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "Belajar Bahasa Papua menggunakan Papua Indonesia Dictionary",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 130.0),
                _searchBar(), // Search bar
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 26,
                    itemBuilder: (context, index) {
                      String letter = String.fromCharCode(65 + index); // Huruf A-Z
                      bool isSelected = selectedLetter == letter;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLetter = letter;
                              displayText = 'Awalan $letter';
                              displayText2 = 'Noun $letter';
                              displayText3 = '$letter means ...';
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Menampilkan kata dengan awalan $letter'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.brown : Colors.transparent,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: isSelected ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (searchQuery.isNotEmpty || selectedLetter.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          searchQuery = '';
                          selectedLetter = 'A'; // Kembali ke default huruf A
                          displayText = 'Awalan A';
                          displayText2 = 'Noun A';
                          displayText3 = 'A means ...';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: getFilteredWords().length,
                    itemBuilder: (context, index) {
                      var entry = getFilteredWords()[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ListTile(
                          title: Text(
                            entry.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 73, 44, 9),
                            ),
                          ),
                          subtitle: Text(
                            entry.value,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk search bar
  Widget _searchBar() {
    return SearchBar(
      hintText: "Cari kata...",
      leading: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(Icons.search),
      ),
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
      trailing: [
        if (searchQuery.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                searchQuery = '';
              });
            },
          ),
      ],
    );
  }
}