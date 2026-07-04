import 'package:flutter/material.dart';
import 'kontak.dart';

class HalamanProyek extends StatelessWidget {
  const HalamanProyek({super.key});

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
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke Beranda
                  },
                  child: const Text('Beranda'),
                ),
                TextButton(
                  onPressed: () {}, // Sudah di halaman Proyek
                  child: Text('Proyek', style: TextStyle(color: Colors.blueGrey.shade800, fontWeight: FontWeight.bold)), // Diberi penanda aktif
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
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
                    title: const Text('Beranda'),
                    onTap: () {
                      Navigator.pop(context); // Tutup drawer
                      Navigator.pop(context); // Kembali ke Beranda
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Proyek', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () => Navigator.pop(context), // Tutup drawer (sudah di halaman Proyek)
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 16 : 40,
          ),
          child: Column(
            children: [
              Text(
                'Pengalaman Proyek Komersial',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade900,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Seluruh proyek di bawah ini dikembangkan di bawah perjanjian kerahasiaan (NDA). Detail visual dan kode sumber disamarkan untuk menghormati privasi klien.',
                style: TextStyle(fontSize: isMobile ? 13 : 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // LIST KARTU PROYEK
              _buildNDAProjectCard(
                title: 'Platform Penyiaran & Streaming Video Lintas Platform',
                category: 'Live Streaming & Media Sosial',
                icon: Icons.live_tv_rounded,
                description: 'Sistem aplikasi berskala besar yang mendukung penyiaran langsung (Live Streaming) dengan optimasi latensi rendah, distribusi konten video vertikal (Reels) dengan infinite scrolling, serta berjalan di ekosistem Mobile, Web, dan aplikasi Desktop khusus.',
                responsibilities: [
                  'Membangun antarmuka multimedia multi-platform (Mobile, Web, dan Desktop) menggunakan satu basis kode Flutter.',
                  'Mengimplementasikan struktur Clean Architecture pada Dart untuk memisahkan logika bisnis dan UI secara modular.',
                  'Mengintegrasikan pemutar video berperforma tinggi untuk memastikan kelancaran fitur scroll reels tanpa memory leak.',
                  'Berkolaborasi dalam sinkronisasi REST API berbasis Python dan database MySQL untuk menjaga kestabilan data streaming.'
                ],
                techStack: ['Flutter', 'Dart', 'Python', 'MySQL', 'REST API', 'Clean Architecture', 'Flutter Desktop'],
                isMobile: isMobile,
                lebarLayar: lebarLayar,
              ),
              const SizedBox(height: 32),
              _buildNDAProjectCard(
                title: 'Ekosistem E-Commerce & Toko Online Skala Besar',
                category: 'E-Commerce / Retail',
                icon: Icons.shopping_bag_outlined,
                description: 'Pengembangan platform belanja daring komprehensif dengan fitur manajemen produk, keranjang belanja kompleks, pelacakan pesanan, serta integrasi sistem pembayaran yang dirancang untuk menangani transaksi harian volume tinggi.',
                responsibilities: [
                  'Mengembangkan arsitektur aplikasi tangguh menggunakan Clean Architecture untuk kemudahan skalabilitas jangka panjang.',
                  'Mengelola state management yang kompleks untuk alur checkout, keranjang, dan pembaruan stok produk secara real-time.',
                  'Mengoptimalkan pemuatan data dan gambar produk beresolusi tinggi guna meminimalkan penggunaan memori perangkat.',
                  'Menghubungkan aplikasi dengan endpoint REST API backend Python untuk memproses transaksi secara aman.'
                ],
                techStack: ['Flutter Multiplatform', 'Dart', 'Python Backend', 'MySQL Database', 'REST API'],
                isMobile: isMobile,
                lebarLayar: lebarLayar,
              ),
              const SizedBox(height: 32),
              _buildNDAProjectCard(
                title: 'Platform On-Demand Service & Sistem Lelang Terbuka',
                category: 'Marketplace Jasa Penataan / Perbaikan',
                icon: Icons.build_circle_outlined,
                description: 'Aplikasi penghubung pengguna dengan teknisi perbaikan perangkat secara on-demand. Dilengkapi dengan fitur unggulan berupa mekanisme penawaran harga (Bidding System) interaktif dari pengguna langsung ke teknisi yang tersedia.',
                responsibilities: [
                  'Merancang arsitektur sistem bidding dan negosiasi harga yang responsif antara sisi pengguna dan mitra teknisi.',
                  'Mengimplementasikan sistem pembaruan status perbaikan secara real-time dari tahap penyerahan hingga selesai.',
                  'Membuat alur navigasi dan manajemen hak akses akun yang berbeda antara tipe pengguna biasa dan akun teknisi.'
                ],
                techStack: ['Flutter', 'Dart', 'State Management', 'Real-time Event Handling', 'REST API'],
                isMobile: isMobile,
                lebarLayar: lebarLayar,
              ),
              const SizedBox(height: 32),
              _buildNDAProjectCard(
                title: 'Aplikasi Manajemen Inventaris & Visualisasi Data',
                category: 'Sistem Logistik Internal',
                icon: Icons.bar_chart_rounded,
                description: 'Perangkat lunak internal yang berfungsi khusus untuk memproses penyortiran data logistik barang masuk dan keluar dalam jumlah besar secara efisien, lengkap dengan dasbor analitik grafik pergerakan barang.',
                responsibilities: [
                  'Mengoptimalkan algoritma pemrosesan lokal untuk penyaringan (filtering) dan penyortiran (sorting) data volume tinggi tanpa lag.',
                  'Mengintegrasikan pustaka grafik visual yang interaktif dan responsif untuk menampilkan tren keluar-masuk barang.',
                  'Merancang tata letak dasbor yang intuitif agar memudahkan operator gudang dalam membaca laporan analitik harian.'
                ],
                techStack: ['Flutter Web/Tablet', 'Dart', 'Data Visualization / Charts', 'Local Data Sorting'],
                isMobile: isMobile,
                lebarLayar: lebarLayar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNDAProjectCard({
    required String title,
    required String category,
    required IconData icon,
    required String description,
    required List<String> responsibilities,
    required List<String> techStack,
    required bool isMobile,
    required double lebarLayar,
  }) {
    return Container(
      width: lebarLayar > 950 ? 900 : double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: Colors.blueGrey.shade700),
            ),
            const SizedBox(width: 24),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade600,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        border: Border.all(color: Colors.amber.shade300),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.lock, size: 12, color: Colors.amber.shade800),
                          const SizedBox(width: 4),
                          Text(
                            'NDA',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: Colors.black87, height: 1.6),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Kontribusi & Implementasi Teknis:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: responsibilities
                      .map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('• ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade700)),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: isMobile ? 13 : 15, color: Colors.black87, height: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: techStack.map((tech) => _buildTechChip(tech)).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
      backgroundColor: Colors.grey.shade100,
      side: BorderSide(color: Colors.grey.shade300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}