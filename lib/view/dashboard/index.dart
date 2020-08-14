import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fixproject/animation/bounce.dart';
import 'package:fixproject/controller/AuthController.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/bottom.dart';
import 'package:fixproject/view/form/input-hitung.dart';
import 'package:fixproject/view/kriteria/list.dart';
import 'package:fixproject/view/hasil/list.dart';
import 'package:fixproject/view/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MaterialAccentColor _theme = Colors.blueAccent;
  Auth apiHelper = new Auth();
  var userData;
  var total_cari;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }
 
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  void _getUserInfo() async {
    SharedPreferences loc = await SharedPreferences.getInstance();
    var userToJson = loc.getString('user');
    if (userToJson == null) {
      _save('0');
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      var user = json.decode(userToJson);
      setState(() {
        userData = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff2f2f2),
        child: Stack(
          children: <Widget>[dashboard, content],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                bottomMenu('Beranda', 1, true, context),
                bottomMenu('Riwayat', 2, false, context),
                bottomMenu('Profil', 3, false, context),
              ],
            )
          ],
        ),
      )),
    );
  }

  get dashboard => Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: biru,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Color(0xfff2f2f2),
            ),
          )
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[header, subgrid, grid],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 32.5),
        title: Text(
          "Selamat Datang",
          style: TextStyle(
              fontFamily: 'Varela',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        subtitle: Text(
          userData == null ? 'GAADA' : '${userData['name']}',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Varela', fontSize: 17.5),
        ),
      );

  get subgrid => Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.045,
            top: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.width * 0.045),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 7.5, left: 10, right: 10),
                child: Container(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
//                  Icon(Icons.slow_motion_video, size: 27.5,),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.apps,
                              size: 27.5,
                              color: biru,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Aplikasi SPPK",
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Varela',
                                  color: biru),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.slow_motion_video,
                        size: 27.5,
                        color: biru,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: biru,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _dashMenu("Hitung", "Bibit Unggul", Icons.today, biru, FormPerhitungan(), context),
                  _dashMenu("Hasil", "Perhitungan", Icons.gesture, biru, ListHasil(), context),
                  _dashMenu("Profil", "User", Icons.perm_contact_calendar, biru, Profile(), context),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  colors: [Color(0xfffafafa), Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            
          ),
          height: MediaQuery.of(context).size.height * 0.225,
          width: double.infinity,
        ),
      );

  get grid => Expanded(
        child: Container(
          // height: 20,
          padding: EdgeInsets.only(right: 16, left: 16, bottom: 16,),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 1,
            childAspectRatio: 2.4,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            // childAspectRatio: .40,
            children: <Widget>[
              _menu(
                  "Hitung Bibit Unggul",
                  "assets/notebook.png",
                  FormPerhitungan(),
                  '_',
                  context),
              _menu(
                  "Kriteria",
                  "assets/corn.png",
                  ListKriteria(),
                  '_',
                  context),
            ],
          ),
        ),
      );
}

Widget _dashMenu(String nama, String total, IconData ic, Color cl, Widget Route, BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        BouncyEffect(widget: Route)
      );
    },
    child: Container(
      child: Column(
        children: <Widget>[
          Icon(
            ic,
            size: 40,
            color: cl,
          ),
          Text(
            nama,
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 17.5,
                color: cl,
                fontWeight: FontWeight.w800),
          ),
          Text(
            total,
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 15,
                color: cl,
                fontWeight: FontWeight.w100),
          )
        ],
      ),
    ),
  );
}

Widget _menu(String namaMenu, String imgPath, Widget Route,void method, context) {
  return Container(
    // height: 100,
    padding: EdgeInsets.all(0),
    child: InkWell(
      onTap: () {
        method;
        Navigator.push(
          context,
          BouncyEffect(widget: Route)
        );
      },
      child: Card(
        // elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.,
            children: <Widget>[
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: 95,
                    width: 75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    )),
                  )),
              Text(
                namaMenu,
                style: TextStyle(
                    color: biru,
                    fontFamily: 'Varela',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildMenu(context),
            _buildMenu(context),
            _buildMenu(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildMenu(context) {
  return Container(
    height: 50.0,
    width: MediaQuery.of(context).size.width / 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Icon(Icons.map), Text("asas")],
    ),
  );
}
