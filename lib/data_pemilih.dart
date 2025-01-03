import 'package:flutter/material.dart';

class DataPemilih extends StatefulWidget {
  const DataPemilih({super.key, required this.pemilih});

  final Map pemilih;

  @override
  State<DataPemilih> createState() => _DataPemilihState();
}

class _DataPemilihState extends State<DataPemilih> {
  final jarak = const SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Pemilihan Umum'),
        backgroundColor: const Color.fromARGB(255, 104, 196, 175),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Data Pemilih',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            Text('NIK: ${widget.pemilih['nik'].toString()}'),
            jarak,
            Text('Nama: ${widget.pemilih['nama_lengkap']}'),
            jarak,
            Text('No. HP: ${widget.pemilih['no_hp'].toString()}'),
            jarak,
            Text('Jenis Kelamin: ${widget.pemilih['jenis kelamin']}'),
            jarak,
            Text('Tanggal Entry: ${widget.pemilih['tgl_pendataan']}'),
            jarak,
            Text('Alamat: ${widget.pemilih['alamat']}'),
            jarak,
            const Text('Gambar: '),
            jarak,
            Container(
              clipBehavior: Clip.hardEdge,
              width: 200,
              height: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                '${widget.pemilih['gambar']}',
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
