import 'package:flutter/material.dart';
import 'package:fixproject/components/modal/error-dialog.dart';
import 'package:fixproject/controller/AuthController.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/bottom.dart';
import 'package:fixproject/view/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class ChangeData extends StatefulWidget {
  String email, name;
  ChangeData({this.email, this.name});
  @override
  _ChangeDataState createState() => _ChangeDataState();
}

class _ChangeDataState extends State<ChangeData> {


  var userData;
  Auth _apiHelper = new Auth();
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
  _saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user';
    final value = null;
    prefs.setString(key, value);
  }

  void _getDataUser() async{
    SharedPreferences locale = await SharedPreferences.getInstance();
    var dataToJson = locale.getString('user');
    var user = json.decode(dataToJson);
    setState(() {
      userData = user;
    });
  }
  @override
  initState(){
    _getDataUser();
    nama = new TextEditingController(text: '${widget.name}');
    email = new TextEditingController(text: '${widget.email}');
    super.initState();
  }
  TextEditingController nama;
  TextEditingController email;



  _onTapped(){
    setState(() {
      if(nama.text.trim().isNotEmpty && email.text.trim().isNotEmpty){
        _apiHelper.changeData(
          nama.text.trim(),
          email.text.trim(),
        ).whenComplete((){
          if(_apiHelper.hasAlready){
            _showDialog('Error','Email Yang Anda Masukkan Telah Digunakan Oleh Akun Yang Lain','Coba Lagi');
          }
          else{
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => new Profile(),
                )
            );
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Text("Ubah Data Diri",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Varela',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05
          ),
          color: Color(0xfff7f7f7),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 65,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: nama,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon:Icon(Icons.contact_mail),
                                labelText: "Nama Lengkap",

                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 65,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon:Icon(Icons.alternate_email),
                                labelText: "Email",

                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: _onTapped,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: biru,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)
                                    )
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Simpan Data',
                                      style: TextStyle(
                                          fontFamily: 'Varela',
                                          fontSize: 16,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
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
                    bottomMenu('Apa Ya', 2, false, context),
                    bottomMenu('Profil', 3, false, context),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
  void _showDialog(String judul, String alasan, String button){
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
            title: judul,
            description: alasan,
            buttonText: button,
            isBlue: false,
        )
    );
  }
}

