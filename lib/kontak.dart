import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPersonPage extends StatelessWidget {
  const ContactPersonPage({super.key});

  // ==========================================
  // FUNGSI UNTUK MEMBUKA URL / APLIKASI EKSTERNAL
  // ==========================================
  Future<void> _bukaUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    // Coba buka URL-nya. Jika gagal, akan diabaikan agar aplikasi tidak crash
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Contact Person', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.contact_mail_outlined, size: 80, color: Colors.blueGrey.shade800),
              ),
              const SizedBox(height: 32),
              Text(
                'Mari Berdiskusi!',
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey.shade900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Apakah Anda memiliki peluang kerja atau proyek menarik?\nJangan ragu untuk menghubungi saya melalui saluran di bawah ini:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
              ),
              const SizedBox(height: 48),
              
              // =========================
              // TOMBOL EMAIL
              // =========================
              SizedBox(
                width: 320, // Sedikit diperlebar agar teks email muat dengan rapi
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Mengarahkan ke email Anda dengan subjek otomatis
                    _bukaUrl('mailto:ryuzinzmoes22@gmail.com?subject=Peluang%20Kerja%20atau%20Proyek');
                  },
                  icon: const Icon(Icons.email_outlined),
                  label: const Text('ryuzinzmoes22@gmail.com', style: TextStyle(fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade800,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // =========================
              // TOMBOL WHATSAPP
              // =========================
              SizedBox(
                width: 320,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Mengarahkan ke nomor WA Anda dengan pesan pembuka otomatis
                    _bukaUrl('https://wa.me/6285795342939?text=Halo,%20saya%20melihat%20portofolio%20Anda%20dan%20tertarik%20untuk%20berdiskusi.');
                  },
                  icon: const Icon(Icons.chat_bubble_outline), 
                  label: const Text('Hubungi via WhatsApp', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}