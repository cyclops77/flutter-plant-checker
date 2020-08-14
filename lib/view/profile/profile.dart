import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fixproject/components/modal/permission.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/bottom.dart';
import 'package:fixproject/setting/change-data.dart';
import 'package:fixproject/setting/change-password.dart';
import 'package:fixproject/view/client/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userData;
  // var total_cari;

  @override
  void initState() {
    _getDataUser();
    // _getHasilCari();
    super.initState();
  }

  // void _getHasilCari() async {
  //   SharedPreferences locale = await SharedPreferences.getInstance();
  //   var dataToJson = locale.getString('totalCari');
  //   // var total = json.decode(dataToJson);
  //   setState(() {
  //     total_cari = 2;
  //   });
  // }

  void _getDataUser() async {
    SharedPreferences locale = await SharedPreferences.getInstance();
    var dataToJson = locale.getString('user');
    var user = json.decode(dataToJson);
    setState(() {
      userData = user;
    });
  }

  _onTapped() {
    setState(() {
      _showDialog(
          'Logout',
          'Apakah anda yakin untuk logout',
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPages(),
          ));
    });
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: biru,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.115,
            ),
            
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.115,
                ),
                 
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(userData == null ? '' : '${userData['name']}',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text("User",
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: Colors.white,
                            fontSize: 14,
                      )),    
                      Text(userData == null ? '' : "ID : ${userData['id']}",
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: Colors.white,
                            fontSize: 14,
                      ))
                    ],
                  ),
                ),
                Hero(
                  tag: "assets/logo12.png",
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    width: 75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/logo12.png"),
                      fit: BoxFit.contain,
                    )),
                  )
                ),   
              ],
            ),
            
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.705,
                    decoration: BoxDecoration(
                        color: Color(0xfff7f7f7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.190,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFFf2f2f2),
                                            blurRadius: 125.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(15.0, 15.0))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Varela',
                                              color: biru),
                                        ),
                                        Text(
                                          userData == null
                                              ? ''
                                              : '${userData['email']}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Varela',
                                              color: Colors.black87),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Total Perhitungan",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Varela',
                                              color: biru),
                                        ),
                                        Text(
                                          // total_cari == null
                                          //     ? '0x Perhitungan'
                                          //     : 
                                              '2x Perhitungan',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Varela',
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.all(17.5),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ChangePassword()));
                                          },
                                          child: Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.lock,
                                                  color: biru,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Ubah Password",
                                                  style: TextStyle(
                                                      fontFamily: 'Verela',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Divider(
                                      height: 0,
                                      indent:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      endIndent:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                      color: Colors.grey,
                                      thickness: 0.7,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(17.5),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ChangeData(
                                                          name:
                                                              "${userData['name']}",
                                                          email:
                                                              "${userData['email']}",
                                                        )));
                                          },
                                          child: Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.low_priority,
                                                  color: biru,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Ubah Data Diri",
                                                  style: TextStyle(
                                                      fontFamily: 'Verela',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ),
                                    InkWell(
                                      onTap: _onTapped,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: biru,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10))),
                                        padding: EdgeInsets.all(17.5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.power_settings_new,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Keluar",
                                              style: TextStyle(
                                                  fontFamily: 'Verela',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFFf2f2f2),
                                          blurRadius: 125.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(15.0, 15.0))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
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
                bottomMenu('Beranda', 1, false, context),
                bottomMenu('Riwayat', 2, false, context),
                bottomMenu('Profil', 3, true, context),
              ],
            )
          ],
        ),
      )),
    );
  }

  void _showDialog(String judul, String alasan, MaterialPageRoute thisRoute) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Permission(
        title: judul,
        description: alasan,
        falseException: 'Batal',
        trueException: 'Yakin',
        route: thisRoute,
        method: _save('0'),
      ),
    );
  }
}
