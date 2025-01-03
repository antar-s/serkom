import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pemilu_app/firebase_service.dart';
import 'package:pemilu_app/utils.dart';

class FormEntry extends StatefulWidget {
  const FormEntry({super.key});

  @override
  State<FormEntry> createState() => _FormEntryState();
}

class _FormEntryState extends State<FormEntry> {
  List<Placemark>? placemarks;
  Position? currentLocation;
  final TextEditingController _alamatController = TextEditingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Lokasi belum dinyalakan');
    }

    permission;
    return await Geolocator.getCurrentPosition();
  }

  int? nik;
  String? nama;
  int? noHp;
  String? jk;
  String? tglSkrg;
  String? alamat;
  String? gambar;
  final String _image =
      'https://images.pexels.com/photos/979190/pexels-photo-979190.jpeg?auto=compress&cs=tinysrgb&w=600';
  bool success = false;
  bool textInfo = false;

  void selectImage() async {
    final File img = await pickImage(ImageSource.gallery);
  }

  void takeImage() async {
    final File img = await pickImage(ImageSource.camera);
  }

  final jarak = const SizedBox(
    height: 10,
  );

  onSave() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Data Pemilih')
          .where('nik', isEqualTo: nik)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        print("NIK sudah ada di database");
        setState(() {
          success = true;
        });
      } else {
        await FirebaseService().createBarang(
            nik: nik!,
            nama: nama ?? '',
            noHP: noHp!,
            jk: jk ?? '',
            tglEntry: tglSkrg ?? '',
            alamat: alamat ?? '',
            gambar: _image.toString());
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error saat menyimpan data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Pemilihan Umum'),
        backgroundColor: const Color.fromARGB(255, 104, 196, 175),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              const Text(
                'Form Entry',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('NIK'),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: const Text('NIK'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onChanged: (value) {
                          nik = int.parse(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Visibility(
                      visible: success,
                      child: AnimatedCrossFade(
                          firstChild: Text(''),
                          secondChild: Text('NIK sudah pernah diinputkan!',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 250, 0, 0))),
                          crossFadeState: textInfo
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 50))),
                ],
              ),
              jarak,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Nama Lengkap'),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('Nama Lengkap'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onChanged: (value) {
                          nama = value;
                        },
                      ),
                    ),
                  )
                ],
              ),
              jarak,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('No. HP'),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: const Text('No. HP'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onChanged: (value) {
                          noHp = int.parse(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
              jarak,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Jenis Kelamin'),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withValues(
                                alpha: 100, blue: 100, green: 100, red: 100)),
                        borderRadius: BorderRadius.circular(12)),
                    width: 250,
                    child: DropdownButton<String>(
                      value: jk,
                      hint: const Text('Pilih Jenis Kelamin'),
                      items: ['Laki-Laki', 'Perempuan'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          jk = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              jarak,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tanggal Entry'),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text('Tanggal Entry'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onChanged: (value) {
                          tglSkrg = value;
                        },
                      ),
                    ),
                  )
                ],
              ),
              jarak,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Alamat'),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _alamatController,
                        decoration: InputDecoration(
                            label: const Text('Alamat'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onChanged: (value) {
                          alamat = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  ElevatedButton(
                      onPressed: () async {
                        currentLocation = await _determinePosition();
                        placemarks = await placemarkFromCoordinates(
                            currentLocation!.latitude,
                            currentLocation!.longitude);
                        alamat =
                            '${placemarks![0].locality}, ${placemarks![0].administrativeArea}, ${placemarks![0].subAdministrativeArea}, ${placemarks![0].postalCode}, ${placemarks![0].country}';
                        setState(() {
                          _alamatController.text = alamat.toString();
                        });
                      },
                      child: const Text('Pilih lokasi sekarang'))
                ],
              ),
              jarak,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Alamat'),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: selectImage,
                          child: const Text('Pilih Gambar')),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: takeImage,
                          child: const Text('Ambil Foto')),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  onSave();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 184, 219, 211)),
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
