import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zainozoho/src/splash/splash.dart'; //import kelas splash
import 'package:zainozoho/src/theme/color.dart'; //import kelas color

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, //menggunakan tema material 3
          primaryColor:
              KColorTheme.warnaUtama), //warna diambil dari dari class color
      home: const Splash(), //jendela awal buka aplikasi
    );
  }
}
