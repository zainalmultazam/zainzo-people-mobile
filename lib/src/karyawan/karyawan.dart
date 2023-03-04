import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zainozoho/src/components/appbar.dart';
import 'package:zainozoho/src/components/inputtext.dart';
import 'package:zainozoho/src/components/listtile/listtilekaryawan.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zainozoho/src/karyawan/profildetail/profiledetail.dart';
import '../components/textstyle/title.dart';
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
  final style = KTextStyle();
  final textfield = KTextField();

  List<Map<String, String>> datakaryawan = [
    {
      'nama': 'Nadzila Afifa',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQF4UMVifTENjA/profile-displayphoto-shrink_800_800/0/1630468969909?e=2147483647&v=beta&t=udbP56QjpMVwOfl-m7Z_NLiXWxU_WjnCTw8LOHgbPNw',
      'namaperusahaan': 'PT Gojek Indonesia',
      'cabang': 'Surabaya',
      'departement': 'Indihome',
      'posisipekerjaan': 'Accounting Manager',
      'levelpekerjaan': 'Tetap',
      'statuspekerjaan': '',
      'tanggalbergabung': '',
      'masakerja': '',
      'idkaryawan': '',
      'jeniskelamin': '',
      'tanggallahir': '',
      'tempatlahir': '',
      'statuspernikahan': '',
      'agama': '',
      'golongandarah': ''
    },
    {
      'nama': 'Karina Santika',
      'jabatan': 'English Translator',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQGNQzV3KSgoQg/profile-displayphoto-shrink_800_800/0/1660284631987?e=2147483647&v=beta&t=nlOwOQFoyKmAka1IhrZNrwEiCn-WTKggsuEdDtFs270',
      'namaperusahaan': '',
      'cabang': '',
      'departement': '',
      'posisipekerjaan': '',
      'levelpekerjaan': '',
      'statuspekerjaan': '',
      'tanggalbergabung': '',
      'masakerja': '',
      'idkaryawan': '',
      'jeniskelamin': '',
      'tanggallahir': '',
      'tempatlahir': '',
      'statuspernikahan': '',
      'agama': '',
      'golongandarah': ''
    },
    {
      'nama': 'Intan Nurita Sari',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQHK1Q2_PzWEwA/profile-displayphoto-shrink_800_800/0/1634366567499?e=1683158400&v=beta&t=7cVDzVNJml0F17c7qxHX18mHptzL6ABWKDgzsgdR48g',
      'namaperusahaan': '',
      'cabang': '',
      'departement': '',
      'posisipekerjaan': '',
      'levelpekerjaan': '',
      'statuspekerjaan': '',
      'tanggalbergabung': '',
      'masakerja': '',
      'idkaryawan': '',
      'jeniskelamin': '',
      'tanggallahir': '',
      'tempatlahir': '',
      'statuspernikahan': '',
      'agama': '',
      'golongandarah': ''
    },
    {
      'nama': 'Ariska Riris',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/C5603AQEpLLe7GUZ-Fw/profile-displayphoto-shrink_800_800/0/1627022282091?e=2147483647&v=beta&t=AQ_RkkT0mmbU0WcFvSQ-c-6N1JEjAvfHEKXfkc9Ohc0',
      'namaperusahaan': '',
      'cabang': '',
      'departement': '',
      'posisipekerjaan': '',
      'levelpekerjaan': '',
      'statuspekerjaan': '',
      'tanggalbergabung': '',
      'masakerja': '',
      'idkaryawan': '',
      'jeniskelamin': '',
      'tanggallahir': '',
      'tempatlahir': '',
      'statuspernikahan': '',
      'agama': '',
      'golongandarah': ''
    },
    {
      'nama': 'Arum Purwita Sari',
      'jabatan': 'Accounting Manager',
      'nomor': '09385839246',
      'email': 'example@email.com',
      'imageurl':
          'https://media.licdn.com/dms/image/D5603AQEJZLMKFcYW_A/profile-displayphoto-shrink_800_800/0/1677652695634?e=1683158400&v=beta&t=uC3BYaus8_ukTV8CvWwYwuP-fEnjn5jmDu4e7e8GtNE',
      'namaperusahaan': '',
      'cabang': '',
      'departement': '',
      'posisipekerjaan': '',
      'levelpekerjaan': '',
      'statuspekerjaan': '',
      'tanggalbergabung': '',
      'masakerja': '',
      'idkaryawan': '',
      'jeniskelamin': '',
      'tanggallahir': '',
      'tempatlahir': '',
      'statuspernikahan': '',
      'agama': '',
      'golongandarah': ''
    },
  ];

  List<Map<String, dynamic>> founduser = [];

  @override
  initState() {
    founduser = datakaryawan;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> result = [];
    if (enteredKeyword.isEmpty) {
      result = datakaryawan;
    } else {
      result = datakaryawan
          .where((element) => element['nama']!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(
      () {
        founduser = result;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Karyawan ${datakaryawan.length}",
                style: style.midstyletext,
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) => runFilter(value),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
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
              Expanded(
                  child: founduser.isNotEmpty
                      ? ListView.builder(
                          itemCount: founduser.length,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Scaffold(
                                              appBar: AppBar(
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                leading: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                      Icons.arrow_back_ios_new,
                                                      size: 19),
                                                ),
                                              ),
                                              body: ListView(
                                                children: [
                                                  Container(
                                                    color: Colors.grey.shade100,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 220,
                                                    child: Column(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  founduser[
                                                                          index]
                                                                      [
                                                                      'imageurl']),
                                                          radius: 40,
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        Text(
                                                          founduser[index]
                                                              ['nama'],
                                                          style: style
                                                              .midstyletext,
                                                        ),
                                                        Text(
                                                            founduser[index]
                                                                ['jabatan'],
                                                            style:
                                                                style.smaller),
                                                        const SizedBox(
                                                            height: 12),
                                                        Container(
                                                          color: Colors
                                                              .transparent,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/karyawan/phone.svg'),
                                                              ),
                                                              IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/karyawan/mail.svg'),
                                                              ),
                                                              IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/karyawan/wa.svg'),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: ExpansionTile(
                                                      title: const Text(
                                                          'Info Pekerjaan'),
                                                      children: [
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'namaperusahaan']),
                                                            label:
                                                                'Nama Perusahaan'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index]
                                                                    ['cabang']),
                                                            label: 'Cabang'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'departement']),
                                                            label:
                                                                'Departement'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'posisipekerjaan']),
                                                            label:
                                                                'Posisi Pekerjaan'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'levelpekerjaan']),
                                                            label:
                                                                'Level Pekerjaan'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'statuspekerjaan']),
                                                            label:
                                                                'Status Pekerjaan'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'tanggalbergabung']),
                                                            label:
                                                                'Tanggal Bergabung'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'masakerja']),
                                                            label:
                                                                'Masa Kerja'),
                                                        const SizedBox(
                                                            height: 20),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: ExpansionTile(
                                                      childrenPadding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      title: const Text(
                                                          'Info Personal'),
                                                      children: [
                                                        const SizedBox(
                                                            height: 15),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'idkaryawan']),
                                                            label:
                                                                'ID Karyawan'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'jeniskelamin']),
                                                            label:
                                                                'Jenis Kelamin'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'tempatlahir']),
                                                            label:
                                                                'Tempat Lahir'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'tanggallahir']),
                                                            label:
                                                                'Tanggal Lahir'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'statuspernikahan']),
                                                            label:
                                                                'Status Pernikahan'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers:
                                                                TextEditingController(
                                                                    text: founduser[
                                                                            index]
                                                                        [
                                                                        'agama']),
                                                            label: 'Agama'),
                                                        const SizedBox(
                                                            height: 20),
                                                        textfield.personaldata(
                                                            controllers: TextEditingController(
                                                                text: founduser[
                                                                        index][
                                                                    'golongandarah']),
                                                            label:
                                                                'Golongan Darah'),
                                                        const SizedBox(
                                                            height: 20),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          color: Colors.transparent,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                founduser[index]['imageurl']),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          width: 200,
                                          height: 50,
                                          color: Colors.transparent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(founduser[index]['nama'],
                                                  style: style.midstyletext,
                                                  maxLines: 1),
                                              Text(
                                                founduser[index]['jabatan'],
                                                maxLines: 1,
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                color: Colors.black12,
                              )
                            ],
                          ),
                        )
                      : const Center(child: Text('Tidak ada data karyawan')))
            ],
          ),
        ),
      ),
    );
  }
}
