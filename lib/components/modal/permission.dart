import 'package:flutter/material.dart';
import 'package:fixproject/css/rep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Permission extends StatelessWidget {

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

  final String title, description, trueException, falseException;
  final MaterialPageRoute route;
  final Image image;
  final void method;
  final void method2;

  Permission({
    @required this.title,
    @required this.description,
    @required this.trueException,
    @required this.falseException,
    this.image,
    this.route,
    this.method,
    this.method2,
  });



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(
            top: Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
//          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: biru,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[


                    SizedBox(height: 15.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Varela',
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),



              SizedBox(height: 44.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Align(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text(falseException,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela',
                            fontSize: 17
                        ),),
                    ),
                  ),
                  Align(

                    child: FlatButton(
                      onPressed: (){
                        method;
                        method2;
                        Navigator.of(context).push(
                            route
                        );
                      },
                      child: Text(trueException,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela',
                            fontSize: 17
                        ),),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ],
    );

  }

}


class Consts {
  Consts._();

  static const double padding = 15.0;
  static const double avatarRadius = 66.0;
}