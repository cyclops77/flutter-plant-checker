
import 'package:flutter/material.dart';
import 'package:fixproject/animation/bounce.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/view/dashboard/index.dart';
import 'package:fixproject/view/hasil/list.dart';
import 'package:fixproject/view/profile/profile.dart';
// import 'kehamilan/index.dart';

Widget bottomMenu(String namaMenu,int index,bool active, context){
  return Container(
    width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          if(index == 1 && active) ...[
            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, BouncyEffect(widget: HomePage())
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: biru,
                  ),
                  Text(namaMenu, style: TextStyle(
                      color: biru,
                      fontFamily: 'Varela'
                  ),)
                ],
              ),
            )
          ],
          if(index == 1 && !active) ...[
            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, BouncyEffect(widget: HomePage())
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  Text(namaMenu, style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Varela'
                  ),)
                ],
              ),
            )
          ],
          if(index == 2 && active) ...[
            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, BouncyEffect(widget: ListHasil())
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.find_replace,
                    color: biru,
                  ),
                  Text(namaMenu, style: TextStyle(
                      color: biru,
                      fontFamily: 'Varela'
                  ),)
                ],
              ),
            )
          ],
          if(index == 2 && !active) ...[
            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, BouncyEffect(widget: ListHasil())
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.find_replace,
                    color: Colors.black,
                  ),
                  Text(namaMenu, style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Varela'
                  ),)
                ],
              ),
            )
          ],
          if(index == 3 && active) ...[
            MaterialButton(
              onPressed: (){
                Navigator.push(
                    context, BouncyEffect(widget: Profile())
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.person_pin,
                    color: biru,
                  ),
                  Text(namaMenu, style: TextStyle(
                      color: biru,
                      fontFamily: 'Varela'
                  ),)
                ],
              ),
            ) 
          ],
          if(index == 3 && !active) ...[
            MaterialButton(
              onPressed: (){
                Navigator.push(context, BouncyEffect(widget: Profile())
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.person_pin,
                    color: Colors.black,
                  ),
                  Text(namaMenu, style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Varela'
                  ),)
                ],
              ),
            )
          ],


        ],
      ),
  );
}
