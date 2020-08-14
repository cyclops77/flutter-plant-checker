import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fixproject/components/modal/alert.dart';
import 'package:fixproject/components/modal/error-dialog.dart';
import 'package:fixproject/controller/AuthController.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/button/btn.dart';
import 'package:fixproject/layout/spaces/vertikal.dart';
import 'package:fixproject/view/client/auth/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  Auth apiHelper = new Auth();
  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  _onPressed(){
    setState(() {
      if(_nameController.text.trim().isNotEmpty
          && _emailController.text.trim().isNotEmpty
          && _passController.text.trim().isNotEmpty){
        apiHelper.registCas(
            _emailController.text.trim(),
            _passController.text.trim(),
            _nameController.text.trim()
        );
        if(apiHelper.statusErrorMsg){
            _showDialog();
            // msgStatus='CEK LAGI YA';
          }else{
            _showDialogSuccess();
          }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/sawah.jpg"), fit: BoxFit.cover)),
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                child: Hero(
                  tag: 'assets/login.png',
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.175,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/login.png'),
                      fit: BoxFit.contain,
                    )),
                  ),
                ),
              ),
              VertikalQuarter(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.025),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 75,
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.contact_mail),
                          labelText: "Nama Lengkap",
                          labelStyle:
                          TextStyle(fontFamily: 'Varela', fontSize: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 75,
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle),
                          labelText: "E-mail",
                          labelStyle:
                          TextStyle(fontFamily: 'Varela', fontSize: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 75,
                      child: TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        controller: _passController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                semanticLabel: _obscureText
                                    ? 'Show Password'
                                    : 'Hide Password',
                              ),
                            ),
                            prefixIcon: Icon(Icons.lock_open),
                            labelText: "Kata Sandi",
                            labelStyle:
                            TextStyle(fontFamily: 'Varela', fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 10.0),
                    ),

                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.75,
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.01),
                        child: new RaisedButton(
                          onPressed: _onPressed,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: biru,
                          child: new Text(
                            'Registrasi',
                            style: new TextStyle(
                                color: Colors.white,
                                backgroundColor: biru),
                          ),
                        ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sudah punya akun ?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Varela'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext
                                          context) =>
                                      LoginPages()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Varela',
                                  color: biru),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showDialogSuccess(){
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialogAlert(
            title: "Sukses",
            description: "Berhasil Melelakukan Registrasi",
            buttonText: "Oke",
            isBlue: true,
            routes: LoginPages(),
        )
    );
  }
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
            title: "Gagal Registrasi",
            description: "Email ini telah digunakan",
            buttonText: "Oke",
            isBlue: true,
        )
    );
  }
}
