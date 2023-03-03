import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:zainozoho/src/components/appbar.dart';
import 'package:zainozoho/src/components/textstyle/title.dart';
import 'package:zainozoho/src/components/listtile/listtile.dart';
import 'package:zainozoho/src/profil/pengingat/pengingatclockoutlisttile.dart';
import '../pengingat/pengingatclockinlisttile.dart';
import '../../components/button.dart';

class PengingatCiCo extends StatefulWidget {
  const PengingatCiCo({super.key});

  @override
  State<PengingatCiCo> createState() => _PengingatCiCoState();
}

class _PengingatCiCoState extends State<PengingatCiCo> {
  final appbarcomponents = KAppBar();
  final button = KButton();
  final styledata = KTextStyle();
  bool pengingatclockin = false;
  bool pengingatclockout = false;
  final listtiles = ListTiles();
  bool pengingathari = false;
  DateTime timeclockin = DateTime.now();
  DateTime timeclockout = DateTime.now();
  void showDialogTime(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarcomponents.appbar(
          context: context, titles: 'Pengingat Clock In/Out'),
      body: ListView(
        children: [
          //Listtile untuk pengingat clockin
          listtiles.listtile(
              time: DateFormat('HH:mm').format(timeclockin),
              onchange: (bool? value) {
                setState(() {
                  pengingatclockin = value ?? false;
                });
                if (value == true) {
                  showDialogTime(CupertinoDatePicker(
                    initialDateTime: timeclockin,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        timeclockin = newTime;
                      });
                    },
                  ));
                }
              },
              text: "Pengingat Clock In",
              values: pengingatclockin),

          //Listtile untuk pengingat clockout
          listtiles.listtile(
              time: DateFormat('HH:mm').format(timeclockout),
              text: "Pengingat Clock Out",
              onchange: (bool? value) {
                setState(() {
                  pengingatclockout = value ?? false;
                });
                if (value == true) {
                  showDialogTime(CupertinoDatePicker(
                    initialDateTime: timeclockout,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        timeclockout = newTime;
                      });
                    },
                  ));
                }
              },
              values: pengingatclockout),

          //if true disyplay this
          pengingatclockin == true
              ? const ContainerPengingatClockIn()
              : const SizedBox.shrink(),

          pengingatclockout == true
              ? const ContainerPengingatClockOut()
              : const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: button.kElevetedButton("Simpan Perubahan", () {}),
      ),
    );
  }
}
