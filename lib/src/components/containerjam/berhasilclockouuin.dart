import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BerhasilCInCout extends StatefulWidget {
  String? timeclockin;
  String? datetimeclockin;
  BerhasilCInCout(
      {super.key, required this.timeclockin, required this.datetimeclockin});

  @override
  State<BerhasilCInCout> createState() => _BerhasilCInCoutState();
}

class _BerhasilCInCoutState extends State<BerhasilCInCout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                ..pop()
                ..pop();
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            SvgPicture.asset('assets/images/berhasil.svg'),
            const SizedBox(height: 15),
            Text(
              widget.timeclockin!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.red,
                  fontFamily: "Inter",
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text('Jam Masuk Berhasil',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              widget.datetimeclockin!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
