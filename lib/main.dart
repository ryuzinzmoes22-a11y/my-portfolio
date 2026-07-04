import 'package:flutter/material.dart';
import 'kontak.dart';
import 'proyek.dart'; // <--- Memanggil file proyek baru

void main() {
  runApp(const PortofolioApp());
}

class PortofolioApp extends StatelessWidget {
  const PortofolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portofolio Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          primary: Colors.blueGrey.shade800,
        ),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;
    final isMobile = lebarLayar < 600;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'DEV.PORTFOLIO',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: isMobile
            ? null
            : [
                TextButton(
                  onPressed: () {}, // Sudah di halaman Beranda
                  child: Text('Beranda', style: TextStyle(color: Colors.blueGrey.shade800, fontWeight: FontWeight.bold)), // Penanda aktif
                ),
                TextButton(
                  onPressed: () {
                    // Pindah ke halaman Proyek
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HalamanProyek()));
                  },
                  child: const Text('Proyek'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Pindah ke halaman Contact Person
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPersonPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Hubungi Saya'),
                ),
                const SizedBox(width: 24),
              ],
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueGrey.shade800),
                    child: const Text(
                      'Navigasi Menus',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Beranda', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () => Navigator.pop(context), // Tutup drawer
                  ),
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Proyek'),
                    onTap: () {
                      Navigator.pop(context); // Tutup drawer
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HalamanProyek()));
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPersonPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade800,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Hubungi Saya'),
                    ),
                  ),
                ],
              ),
            )
          : null,
      
      // Menggunakan tinggi layar dikurangi tinggi AppBar agar Hero Section memenuhi layar
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - kToolbarHeight, 
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Halo, Saya Flutter Developer',
              style: TextStyle(
                fontSize: isMobile ? 32 : 56,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey.shade900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Berpengalaman membangun aplikasi multi-platform berkinerja tinggi, aman, dan terarsitektur dengan baik.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 22,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    // Tombol ini bisa Anda arahkan ke GitHub jika mau
                  },
                  icon: const Icon(Icons.link),
                  label: const Text('GitHub Saya'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                    side: BorderSide(color: Colors.blueGrey.shade800, width: 2),
                    foregroundColor: Colors.blueGrey.shade800,
                  ),
                ),
                const SizedBox(width: 16),
                
                // Tambahan tombol cepat untuk melihat proyek di beranda
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HalamanProyek()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                    backgroundColor: Colors.blueGrey.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Lihat Karya Saya'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}