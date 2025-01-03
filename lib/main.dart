import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pemilu_app/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDLoJ5yKxaf_sAveqNsLX6Hqie7y7FiL2g',
          appId: '1:307895490132:android:9bc653b9014b79c12d3fc1',
          messagingSenderId: '307895490132',
          projectId: 'aplikasi-pemilu-5e4a7'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
