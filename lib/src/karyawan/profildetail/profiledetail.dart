// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:url_launcher/url_launcher.dart';
// import 'package:zainozoho/src/components/appbar.dart';
// import 'package:zainozoho/src/components/textstyle/title.dart';

// class DetailProfile extends StatefulWidget {
//   final String nama;
//   final String jabatan;
//   final String urlimage;
//   const DetailProfile(
//       {super.key,
//       required this.nama,
//       required this.jabatan,
//       required this.urlimage});

//   @override
//   State<DetailProfile> createState() => _DetailProfileState();
// }

// class _DetailProfileState extends State<DetailProfile> {
//   final appbar = KAppBar();
//   final style = KTextStyle();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbar.appbar(
//         context: context,
//         leadings: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 18,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(15),
//         children: [
//           //Container untuk profile name foto and row icon
//           Container(
//             width: MediaQuery.of(context).size.width,
//             color: Colors.grey.shade200,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(widget.urlimage),
//                   radius: 30,
//                 ),
//                 Text(widget.nama, style: style.midstyletext),
//                 Text(widget.jabatan, style: style.smaller),
//                 Container(
//                   color: Colors.green,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: SvgPicture.asset(
//                               'assets/icons/karyawan/phone.svg')),
//                       IconButton(
//                           onPressed: () {},
//                           icon: SvgPicture.asset(
//                               'assets/icons/karyawan/mail.svg')),
//                       IconButton(
//                           onPressed: () {},
//                           icon:
//                               SvgPicture.asset('assets/icons/karyawan/wa.svg')),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



/* 
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

*/