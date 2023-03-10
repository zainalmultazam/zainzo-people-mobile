import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zainozoho/src/mainpage/mainpage.dart';
import '../components/inputtext.dart'; //import kelas textfield
import '../components/button.dart'; //import kelas button
import '../login/lupasandi/lupasandi.dart'; //import kelas lupa sandi
import '../theme/color.dart'; //import kelas color
import '../controller/loginlogic.dart'; //import kelas loginlogic untuk logika sign in

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textfield = KTextField(); //inisialisasi objek untuk kelas textfield
  final button = KButton(); //inisialisasi objek untuk kelas button
  final emailcontroller =
      TextEditingController(); //inisialisasi email controller
  final passwordcontroller =
      TextEditingController(); //inisialisasi password controller
  static bool tampilsandi = true; //boolean untuk tampil kata sandi

  final logika = LogicMasuk(); //inisialisasi objek untuk kelas logicmasuk

  late SharedPreferences logindata;
  late bool newuser;

  late StreamSubscription
      subscription; //inisialisasi untuk koneksi internet hilang
  var isDeviceConnected = false;
  bool isAlert = false;

  @override
  void initState() {
    super.initState();
    checkifalreadylogin();
    getConnectivity();
  }

  void checkifalreadylogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    if (newuser == false) {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NavMainPage()));
      });
    }
  }

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlert == false) {
          // alert.dialogError(context: context);
          dialogError();
          setState(
            () {
              isAlert = true;
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  dialogError() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Koneksi Gagal'),
        content: const Text(
            'Gagal terhubung ke internet, mohon periksa kembali koneksi anda!'),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () async {
              Navigator.pop(context);
              setState(
                () async {
                  isAlert = false;
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    dialogError();
                    setState(() {
                      isAlert = true;
                    });
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  // var db = MySql();
  // var nama = "";

  // void getMahasiswa() {
  //   db.getConnection().then((conn) {
  //     String sql = "select nama from mahasiswa where kelas = '3b1';";
  //     conn.query(sql).then((result) {
  //       setState(() {
  //         for (var row in result) {
  //           setState(() {
  //             nama = row[0];
  //           });
  //         }
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //saya beri listview agar saat keyboard muncul dan tidak mengganggu layout
        padding: const EdgeInsets.only(top: 50, left: 23, right: 23),
        children: [
          const SizedBox(height: 50),

          //Stack image karna gambar image terlalu besar maka saya tumpuk dia dengan widget yang lain
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/icons/Vector.png',
                scale: 2.4,
              )
            ],
          ), //Logo Peduly
          const SizedBox(height: 50),

          //Text Masuk pada login
          const Text(
            'Masuk',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ), //Text Masuk
          ),

          //Teks Untuk mengakses zainzo people
          const Text(
            'Untuk mengakses Zainzo People',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black87), //Text Untuk mengakses Zainzo People
          ),
          const SizedBox(height: 20),

          //Text Input form Email
          textfield.kUsernameField(
              controller: emailcontroller), //TextField Email
          const SizedBox(height: 20),

          //Text Input form password
          TextFormField(
            autofillHints: const [AutofillHints.password],
            obscureText: tampilsandi,
            obscuringCharacter: '*',
            textInputAction: TextInputAction.go,
            validator: (e) {
              if (e!.isEmpty) {
                return "Harap Masukkan Password";
              }
              return null;
            },
            controller: passwordcontroller, //controller password
            decoration: InputDecoration(
              label: const Text('Password'),
              hintText: "Password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    tampilsandi = !tampilsandi;
                  });
                },
                icon: Icon(
                  tampilsandi
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: KColorTheme.warnaUtama,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          button.kTextButton(
            'Lupa Password?',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LupaSandi(),
              ),
            ),
          ), //TextButton lupa sandi
          //Button Masuk
        ],
      ),

      //Tombol untuk masuk, untuk deklarasi email dan password sementara,
      //ada di parameter fungsi dibawah ini
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18),
        child: button.kElevetedButton(
          "Masuk",
          () {
            logika.logicmasuk(
                logindata: logindata,
                newuser: newuser,
                contexts: context,
                email: emailcontroller,
                password: passwordcontroller,
                emaildummy: "soho@email.com",
                passworddummy: "1");
            // if (emaildata.isNotEmpty && passworddata.isNotEmpty) {
            //   logindata.setBool('login', false);
            //   logindata.setString('username', emaildata);
            //   Navigator.pushReplacement(context,
            //       MaterialPageRoute(builder: (context) => const NavMainPage()));
            // }
          },
        ),
      ),
    );
  }
}
