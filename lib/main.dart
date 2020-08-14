import 'package:flutter/material.dart';
import 'package:fixproject/view/client/auth/login.dart';
// import 'package:fixproject/view/client/auth/login.dart';
import 'package:fixproject/view/client/home.dart';
import 'package:fixproject/view/dashboard/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Android Project",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new homePageAwal(title: "-",),
      routes: <String, WidgetBuilder>{
        '/dashboard' : (BuildContext context) => new homePageAwal(),
        '/login' : (BuildContext context) => new LoginPages(),
        '/hasLogin' : (BuildContext context) => new HomePage(),
      },
    );
  }
}
