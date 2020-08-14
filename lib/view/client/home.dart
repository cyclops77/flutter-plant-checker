import 'package:flutter/material.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/button/btn.dart';
import 'package:fixproject/layout/paragraph/paragraph.dart';
import 'package:fixproject/layout/spaces/horisontal.dart';
import 'package:fixproject/layout/spaces/vertikal.dart';
import 'package:fixproject/view/client/auth/login.dart';
import 'package:fixproject/view/client/auth/register.dart';
// import 'package:fixproject/text/paragraph.dart';
import 'package:fixproject/view/dashboard/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePageAwal extends StatefulWidget {
  homePageAwal({Key key, this.title}) : super(key: key);
  final String title;
  @override
  homePageAwalState createState() => homePageAwalState();
}

class homePageAwalState extends State<homePageAwal> {
  _readHasLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    final _first = prefs.getString("token");

    if(value != '0'){
      Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new HomePage(),
          )
      );
    }
  }
  @override
  initState(){
    _readHasLoggedIn();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'a',
      home: Scaffold(
        body: Container(
          color: biru,
          child: ListView(
            padding: const EdgeInsets.only(
                top: 125, 
                left: 12.0, 
                right: 12.0, 
                bottom: 12.0
            ),
            children: <Widget>[
              Container(
                height: 200,
                child: Hero(
                  tag: 'assets/farmer.png',
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.175,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/farmer.png'),
                      fit: BoxFit.contain,
                    )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: <Widget>[
                    Pharagraph1(
                      teks: "MY CORN",
                      warna: putih,
                    ),
                    Vertikal(),
                    Pharagraph6(
                      teks: "Aplikasi untuk menentukan kualitas bibit tanaman jagung",
                      warna: putih,
                    ),
                    // Pharagraph6B(
                    //   teks: "dengan metode SAW",
                    //   warna: putih,
                    // ),
                    Vertikal2(),
                    btnOutline(
                      teks: "Masuk",
                      route: MaterialPageRoute(
                          builder: (BuildContext context) => LoginPages(),
                      ),
                    ),
                    VertikalQuarter(),
                    btnLink(
                      teks: "Registrasi",
                      route: MaterialPageRoute(
                          builder: (BuildContext context) => RegisterPage(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}