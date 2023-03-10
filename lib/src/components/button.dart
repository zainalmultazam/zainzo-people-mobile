import 'package:flutter/material.dart';
import 'package:zainozoho/src/components/textstyle/title.dart';
import 'package:zainozoho/src/theme/color.dart'; //import kelas color

class KButton {
  final styletext = KTextStyle();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  //TextButton
  TextButton kTextButton(String judul, Function() onpressing) {
    return TextButton(
      onPressed: onpressing,
      child: Text(
        judul,
        style: TextStyle(color: KColorTheme.warnaDasar),
      ),
    );
  }

  OutlinedButton kOutlineButton(
      {required Function() func, required String? titles}) {
    return OutlinedButton(
        onPressed: func,
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(15),
          side: BorderSide(color: KColorTheme.warnaUtama),
        ),
        child: Text(
          "$titles",
          style: TextStyle(color: KColorTheme.warnaUtama),
        ));
  }

  //ElevetedButton
  ElevatedButton kElevetedButton(String judul, Function() onpressing) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // <-- Radius
          ),
          backgroundColor: KColorTheme.warnaUtama.shade600,
          padding: const EdgeInsets.all(18) // Background color
          ),
      onPressed: onpressing,
      child: Text(
        judul,
        style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
