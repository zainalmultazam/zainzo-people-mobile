import 'package:flutter/material.dart';

class LihatLogAbsensi extends StatefulWidget {
  String? bulan;
  LihatLogAbsensi({super.key, required this.bulan});

  @override
  State<LihatLogAbsensi> createState() => _LihatLogAbsensiState();
}

class _LihatLogAbsensiState extends State<LihatLogAbsensi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Absesnsi',
          style: TextStyle(fontFamily: 'Inter'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade600),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 18),
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 18),
                Text(widget.bulan!,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        color: Colors.grey.shade600)),
                const SizedBox(width: 210),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade600,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
