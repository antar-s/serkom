import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pemilu_app/daftar_pemilih.dart';
import 'package:pemilu_app/form_entry.dart';
import 'package:pemilu_app/informasi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const jarak = SizedBox(
      height: 15,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Pemilihan Umum'),
        backgroundColor: const Color.fromARGB(255, 104, 196, 175),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'KPU',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            jarak,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ));
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 220,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 184, 219, 211),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3))
                      ]),
                  child: const Text(
                    'Informasi',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            jarak,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormEntry(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 219, 211),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: const Text(
                  'Form Entry',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            jarak,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DaftarPemilih(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 219, 211),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: const Text(
                  'Lihat Data',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            jarak,
            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 219, 211),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                child: const Text(
                  'Keluar',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
