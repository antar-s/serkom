import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pemilu_app/data_pemilih.dart';
import 'package:pemilu_app/firebase_service.dart';

class DaftarPemilih extends StatefulWidget {
  const DaftarPemilih({super.key});

  @override
  State<DaftarPemilih> createState() => _DaftarPemilihState();
}

class _DaftarPemilihState extends State<DaftarPemilih> {
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(15),
            child: const Text(
              'Daftar Pemilih',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Data Pemilih')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 6,
                    );
                  },
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final listPemilih =
                        snapshot.data!.docs[index].data() as Map;
                    listPemilih['id'] = snapshot.data!.docs[index].id;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DataPemilih(pemilih: listPemilih),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NIK: ${listPemilih['nik'].toString()}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  jarak,
                                  Text(
                                    'Nama: ${listPemilih['nama_lengkap']}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  jarak,
                                  Text(
                                    'No. HP: ${listPemilih['no_hp'].toString()}}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  jarak,
                                  Text(
                                    'Jenis Kelamin: ${listPemilih['jenis_kelamin']}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  jarak,
                                  Text(
                                    'Tanggal Entry: ${listPemilih['tgl_pendataan']}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  ),
                                  jarak,
                                  Text(
                                    'Alamat: ${listPemilih['alamat']}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  jarak,
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                FirebaseService()
                                    .deleteBarang(docId: listPemilih['id']);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => widget,
                                    ));
                              },
                              icon: const Icon(Icons.delete),
                              color: const Color.fromARGB(255, 184, 219, 211),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
