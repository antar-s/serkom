import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future createBarang(
      {required int nik,
      required String nama,
      required int noHP,
      required String jk,
      required String tglEntry,
      required String alamat,
      required String gambar}) async {
    try {
      await FirebaseFirestore.instance.collection('Data Pemilih').add({
        'nik': nik,
        'nama_lengkap': nama,
        'no_hp': noHP,
        'jenis_kelamin': jk,
        'tgl_pendataan': tglEntry,
        'alamat': alamat,
        'gambar': gambar,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future deleteBarang({required String docId}) async {
    try {
      await FirebaseFirestore.instance.collection('Data Pemilih').doc(docId).delete();
    } catch (e) {
      rethrow;
    }
  }
}