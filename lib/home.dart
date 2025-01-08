import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedLetter = ''; // Huruf yang dipilih
  String displayText = ''; // Variabel untuk menyimpan teks
  String displayText2 = '';
  String displayText3 = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.grey),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png', // Path ke file gambar
                width: 30.0,
                height: 50.0,
              ),
              const SizedBox(width: 10), // Jarak antara gambar dan teks
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
          backgroundColor: const Color.fromARGB(255, 114, 74, 25).withOpacity(0.8),
          elevation: 0.5,
          shadowColor: Colors.grey,
          toolbarHeight: 70.0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.55, 0.55, 1.0], // Memastikan perpisahan warna di tengah
              colors: [
                Color.fromARGB(255, 114, 74, 25),
                Color.fromARGB(255, 153, 87, 32), // Coklat muda
                Color.fromARGB(255, 236, 236, 236),
                Color.fromARGB(255, 236, 236, 236), // Abu-abu muda di bawah
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Teks utama
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
                    textAlign: TextAlign.center, // Teks berada di tengah
                  ),
                ),
                const SizedBox(height: 15.0), // Jarak antara teks utama dan teks kecil
                // Teks kecil di bawahnya
                const Text(
                  "Belajar Bahasa Papua menggunakan Papua Indonesia Dictionary",
                  style: TextStyle(
                    fontSize: 16.0, // Ukuran teks lebih kecil
                    color: Colors.white, // Warna teks abu-abu
                  ),
                  textAlign: TextAlign.center, // Teks berada di tengah
                ),
                const SizedBox(height: 130.0), // Jarak antara teks dan search bar
                // Search bar
                _searchBar(),
                const SizedBox(height: 30.0), // Jarak antara search bar dan list huruf
                // Scroll huruf
                SizedBox(
                  height: 50, // Tinggi bar huruf
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 26, // Total huruf A-Z
                    itemBuilder: (context, index) {
                      String letter = String.fromCharCode(65 + index); // Menghasilkan huruf A-Z
                      bool isSelected = selectedLetter == letter; // Mengecek apakah huruf dipilih
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0), // Jarak antar huruf
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLetter = letter;
                              displayText = 'Awalan $letter';
                              displayText2 = 'Noun $letter';
                              displayText3 = '$letter means ...'; // Simpan huruf yang dipilih
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50, // Lebar setiap huruf
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.brown // Warna coklat jika dipilih
                                  : Colors.transparent, // Warna default
                              borderRadius: BorderRadius.circular(50.0), // Sudut melengkung
                            ),
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: isSelected
                                    ? Colors.white // Warna teks putih jika dipilih
                                    : Colors.grey, // Warna teks default
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                // Teks yang ditampilkan berdasarkan huruf yang dipilih
                Align(
                  alignment: Alignment.centerLeft, // Menyelaraskan teks ke kiri
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Menyelaraskan teks di kiri dalam kolom
                    children: [
                      Text(
                        displayText,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 10), // Memberikan jarak antar teks
                      Text(
                        displayText2,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10), // Memberikan jarak antar teks
                      Text(
                        displayText3,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return const SearchBar(
      hintText: "Cari kata...",
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(Icons.search),
      ),
    );
  }
}
