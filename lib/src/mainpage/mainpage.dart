import 'package:flutter/material.dart';
import '../home/home.dart';
import '../theme/color.dart'; //import kelas color
import 'package:flutter_svg/flutter_svg.dart'; //import kelas svg untuk icon navigasi bar

class NavMainPage extends StatefulWidget {
  const NavMainPage({super.key});

  @override
  State<NavMainPage> createState() => _NavMainPageState();
}

class _NavMainPageState extends State<NavMainPage> {
  //inisialisasi index navigasi bar
  int _selectedIndex = 0;

  //inisialisasi boolean untuk aktif nonaktif icon navigasi bar
  bool aktif = false;

  //dummy text pada body
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //inisialisasi list untuk peletakan fungsi navigasi bar
  static const List<Widget> _widgetnav = <Widget>[
    //fungsi window Home
    Home(),

    //fungsi window jadwal
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),

    //fungsiw window akun
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  //inisialisasi fungsi saat ditap pada navigasi bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body nya adalah isi dari sebuah window fungsi yang sudah diset pada _widgetnav
      body: Center(
        child: _widgetnav.elementAt(_selectedIndex),
      ),

      // inisialisasi Navigatorbar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/icon_home_nonaktif.svg'),
            activeIcon: SvgPicture.asset('assets/icons/icon_home_aktif.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/icon_jadwal_nonaktif.svg'),
            activeIcon: SvgPicture.asset('assets/icons/icon_jadwal_aktif.svg'),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/icon_akun_nonaktif.svg'),
            activeIcon: SvgPicture.asset('assets/icons/icon_akun_aktif.svg'),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: KColorTheme.warnaUtama,
        onTap: _onItemTapped,
      ),
    );
  }
}
