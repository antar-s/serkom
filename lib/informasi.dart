import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Pemilihan Umum'),
        backgroundColor: const Color.fromARGB(255, 104, 196, 175),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Informasi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            Text('Dengan hormat, Kami informasikan bahwa Pemilihan Umum (Pemilu) akan segera dilaksanakan. Diharapkan kepada seluruh masyarakat yang telah memenuhi syarat sebagai pemilih untuk menggunakan hak pilihnya secara bijaksana. Pastikan Anda sudah terdaftar dalam daftar pemilih dan membawa dokumen yang diperlukan pada hari pemungutan suara. Mari bersama-sama berpartisipasi aktif dalam Pemilu untuk menentukan masa depan yang lebih baik. Suara Anda sangat berarti bagi kemajuan bangsa. Terima kasih atas perhatian dan partisipasinya.  Hormat kami,  Panitia Pemilihan Umum', textAlign: TextAlign.justify,)
          ],
        ),
      ),
    );
  }
}