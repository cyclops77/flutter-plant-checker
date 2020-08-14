import 'package:flutter/cupertino.dart';

class BouncyEffect extends PageRouteBuilder {
  final Widget widget;

  BouncyEffect({this.widget})
      : super(
      transitionDuration: Duration(seconds: 0),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.easeOutQuad);
        return ScaleTransition(
          alignment: Alignment.centerRight,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation) {
        return widget;
      });

}