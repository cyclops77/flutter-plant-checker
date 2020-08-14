import 'package:flutter/material.dart';
import 'package:fixproject/css/rep.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  final bool isBlue;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
    @required this.isBlue,
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
            right: Consts.padding * 0.5,
          ),
//          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: isBlue == true ? biru : Color(0xFFe83b20),
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
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Varela',
                      fontSize: 20
                    ),),
                ),
              ),

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