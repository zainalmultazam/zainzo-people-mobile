import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zainozoho/src/components/appbar.dart';
import 'package:zainozoho/src/components/listtile/listtilekaryawan.dart';

import '../models/mysqlconnection.dart';

class Karyawan extends StatefulWidget {
  const Karyawan({super.key});

  @override
  State<Karyawan> createState() => _KaryawanState();
}

class _KaryawanState extends State<Karyawan> {
  int jumlahkaryawan = 0;
  final searchcontroller = TextEditingController();
  final appbar = KAppBar();
  var db = MySql();
  var nama = "";
  final listtile = ListTileKaryawan();

  void getMahasiswa() {
    db.getConnection().then((conn) {
      String sql = "select nama from mahasiswa where kelas = '3b1';";
      conn.query(sql).then((result) {
        setState(() {
          for (var row in result) {
            setState(() {
              nama = row[0];
            });
          }
        });
      });
    });
  }

  List<Map<String, String>> datakaryawan = [
    {
      'nama': 'Nadzila Afifa',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQF4UMVifTENjA/profile-displayphoto-shrink_800_800/0/1630468969909?e=2147483647&v=beta&t=udbP56QjpMVwOfl-m7Z_NLiXWxU_WjnCTw8LOHgbPNw'
    },
    {
      'nama': 'Karina Santika',
      'jabatan': 'English Translator',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQGNQzV3KSgoQg/profile-displayphoto-shrink_800_800/0/1660284631987?e=2147483647&v=beta&t=nlOwOQFoyKmAka1IhrZNrwEiCn-WTKggsuEdDtFs270'
    },
    {
      'nama': 'Intan Nurita Sari',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQHK1Q2_PzWEwA/profile-displayphoto-shrink_800_800/0/1634366567499?e=1683158400&v=beta&t=7cVDzVNJml0F17c7qxHX18mHptzL6ABWKDgzsgdR48g'
    },
    {
      'nama': 'Ariska Riris',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQEpLLe7GUZ-Fw/profile-displayphoto-shrink_800_800/0/1627022282091?e=2147483647&v=beta&t=AQ_RkkT0mmbU0WcFvSQ-c-6N1JEjAvfHEKXfkc9Ohc0'
    },
    {
      'nama': 'Arum Purwita Sari',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/D5603AQEJZLMKFcYW_A/profile-displayphoto-shrink_800_800/0/1677652695634?e=1683158400&v=beta&t=uC3BYaus8_ukTV8CvWwYwuP-fEnjn5jmDu4e7e8GtNE'
    },
  ];

  @override
  Widget build(BuildContext context) {
    jumlahkaryawan = datakaryawan.length;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
        children: [
          //Jumlah karyawan
          Text(
            "Karyawan $jumlahkaryawan",
            style: const TextStyle(
                fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          //Search Bar
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(17),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black12)),
              hintText: "Cari",
              prefixIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: datakaryawan.map((e) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.transparent,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("${e['imageurl']}"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 200,
                          height: 50,
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${e['nama']}",
                                maxLines: 1,
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("${e['jabatan']}",
                                  style: const TextStyle(fontFamily: "Inter"))
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/icons/karyawan/phone.svg'),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/icons/karyawan/mail.svg'),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/icons/karyawan/wa.svg'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.black12,
                    )
                  ]);
            }).toList(),
          )
        ],
      ),
    );
  }
}
