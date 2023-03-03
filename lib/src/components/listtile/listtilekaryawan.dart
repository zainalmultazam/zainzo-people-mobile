import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:zainozoho/src/models/mysqlconnection.dart';

class ListTileKaryawan {
  template(
      {required String nama,
      required String jabatan,
      required String urlimage,
      required String phone}) {
    return Column(children: [
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(urlimage),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(jabatan, style: const TextStyle(fontFamily: "Inter"))
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/karyawan/phone.svg'),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/karyawan/mail.svg'),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/karyawan/wa.svg'),
          )
        ],
      ),
      const SizedBox(height: 10),
      const Divider(
        color: Colors.black12,
      )
    ]);
  }
}
