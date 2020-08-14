import 'package:flutter/material.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/view/dashboard/index.dart';

class btnStandart extends StatelessWidget {
  final String teks;
  final void method;
  final MaterialPageRoute route;
  btnStandart({
    @required this.teks,
    @required this.method,
    this.route,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            route
        );
      },
      child: Container(
        height: 50,
        color: biru,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(teks,
            style: TextStyle(
                color: putih,
            ))
          ],
        )
      ),
    );
  }
}

class btnOutline extends StatelessWidget {
  final String teks;
  final void method;
  final MaterialPageRoute route;
  btnOutline({
    @required this.teks,
    @required this.method,
    this.route,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            route
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2
          ),
          
        ),
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(teks,
            style: TextStyle(
                color: Colors.white,
            ))
          ],
        )
      ),
    );
  }
}


class btnLink extends StatelessWidget {
  final String teks;
  final MaterialPageRoute route;
  btnLink({
    @required this.teks,
    this.route,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            route
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(teks,
            style: TextStyle(
                color: Colors.white,
            ))
          ],
        )
      ),
    );
  }
}
