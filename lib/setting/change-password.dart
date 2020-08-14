import 'package:flutter/material.dart';
import 'package:fixproject/components/modal/error-dialog.dart';
import 'package:fixproject/css/rep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  // ApiHelper _apiHelper = new ApiHelper();
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


  TextEditingController currentPass = new TextEditingController();
  TextEditingController newPass = new TextEditingController();
  TextEditingController reTypePass = new TextEditingController();

  _onTapped(){
    setState(() {
      // if(currentPass.text.trim().isNotEmpty && newPass.text.trim().isNotEmpty && reTypePass.text.trim().isNotEmpty){
      //   _apiHelper.changePassword(
      //       currentPass.text.trim(),
      //       newPass.text.trim(),
      //       reTypePass.text.trim(),
      //   ).whenComplete((){
      //     if(_apiHelper.statusErrorMsg){
      //       _showDialog('Error','Password Baru Tidak Sesuai');
      //     }else if(_apiHelper.errorInSame){
      //       _showDialog('Error','Password Lama Tidak Sesuai');
      //     }else if(_apiHelper.errorInSame && _apiHelper.statusErrorMsg){
      //       _showDialog('Error','Password Lama dan Tidak Sesuai');
      //     }
      //     else{
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (BuildContext context) => new Profile(),
      //         )
      //       );
      //     }
      //   });
      // }
    });
  }


  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Text("Ganti Kata Sandi",
          style: TextStyle(
            fontSize: 18,
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
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: _obscureText1,
                          controller: currentPass,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                              child: Icon(
                                _obscureText1 ? Icons.visibility : Icons.visibility_off,
                                semanticLabel: _obscureText1 ? 'Show Password' : 'Hide Password',
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            prefixIcon:Icon(Icons.lock_open),
                            labelText: "Password Saat Ini",

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 0.7,
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: _obscureText2,
                          controller: newPass,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                              child: Icon(
                                _obscureText2 ? Icons.visibility : Icons.visibility_off,
                                semanticLabel: _obscureText2 ? 'Show Password' : 'Hide Password',
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            prefixIcon:Icon(Icons.lock_open),
                            labelText: "Password Baru",

                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: _obscureText3,
                          controller: reTypePass,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText3 = !_obscureText3;
                                });
                              },
                              child: Icon(
                                _obscureText3 ? Icons.visibility : Icons.visibility_off,
                                semanticLabel: _obscureText3 ? 'Show Password' : 'Hide Password',
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            prefixIcon:Icon(Icons.lock_open),
                            labelText: "Ulangi Password",

                          ),
                        ),
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
                                Text("Ubah Password",
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
    bottomNavigationBar: BottomAppBar()
    );
  }
  void _showDialog(String judul, String alasan){
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: judul,
        description:alasan,
        buttonText: "Okay",
        isBlue: false,
      ),
    );
  }
}

