import 'package:flutter/material.dart';
import 'package:fixproject/components/modal/permission.dart';
import 'package:fixproject/controller/PerhitunganController.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/bottom.dart';
import 'package:fixproject/layout/spaces/horisontal.dart';
import 'package:fixproject/layout/spaces/vertikal.dart';
import 'package:fixproject/view/hasil/list.dart';

class DetailData extends StatefulWidget {
  List list;
  int index;
  DetailData({Key key, this.title, this.index, this.list}) : super(key: key);
  final String title;
  
  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {

  PerhitunganController apiHelper = new PerhitunganController();

  _onTapped() {
    setState(() {
      _showDialog(
          'Konfirmasi',
          'Yakin ingin menghapus data ? ',
          MaterialPageRoute(
            builder: (BuildContext context) => ListHasil(),
          ));
    });
  }
  hapusData(int id) async{
    apiHelper.delete(id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Container(
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                          //   Color(0xfffea4c0),
                          //   Color(0xffffd0e2),
                          //   Color(0xfffeeaf3),
                          // ]),
                          color: biru,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              // bottomRight: Radius.circular(30)
                              )),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: 10,
                        bottom: 20
                    ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                      Text(
                        "${widget.list[widget.index]['nama']}",
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
    
                      Container(
                        child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Peringkat ${widget.list[widget.index]['rank']}",
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 17.5,
                                  color: biru,
                                ),
                              ),
                              Vertikal2(),
                              isianText(
                                "Hasil Panen", 
                                "${widget.list[widget.index]['c1']}" ,
                                "${widget.list[widget.index]['t1']}",
                                "${widget.list[widget.index]['p1']}", 
                                context),
                              isianText(
                                "Baris Biji", 
                                "${widget.list[widget.index]['c2']}" ,
                                "${widget.list[widget.index]['t2']}", 
                                "${widget.list[widget.index]['p2']}", 
                                context),
                              isianText("Akar", 
                                "${widget.list[widget.index]['c3']}" ,
                                "${widget.list[widget.index]['t3']}",
                                "${widget.list[widget.index]['p3']}", 
                              context),
                              isianText("Warna Daun", 
                                "${widget.list[widget.index]['c4']}" ,
                                "${widget.list[widget.index]['t4']}",
                                "${widget.list[widget.index]['p4']}", 
                              context),
                              isianText("Ketahanan Hama", 
                                "${widget.list[widget.index]['c5']}" ,
                                "${widget.list[widget.index]['t5']}",
                                "${widget.list[widget.index]['p5']}", 
                              context),
                              Divider(
                                color: biru,
                                thickness: 1.4,
                                indent: MediaQuery.of(context).size.width * 0.45,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      child: Text(
                                      "Total ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Varela',
                                        fontSize: 17.5,
                                        color: biru,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " : ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Varela',
                                      fontSize: 17.5,
                                      color: biru,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        " ${widget.list[widget.index]['total']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Varela',
                                          fontSize: 17.5,
                                          color: biru,
                                        ),
                                      ),
                                    ),
                                    
                                  ],)
                                ],
                              ),
                              
                              Vertikal(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: ()=>Navigator.of(context).push(
                                      new MaterialPageRoute(builder: (BuildContext context) => new ListHasil())
                                    ),
                                    child: Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Kembali", style: TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                      height: 40,
                                      width: 100,
                                      color: biru,
                                    ),
                                  ),
                                  

                                  GestureDetector(
                                    onTap: (){
                                      _onTapped();
                                    },
                                    child: Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Hapus", style: TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                      height: 40,
                                      width: 100,
                                      color: biru,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                          height: 355,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.05,
                              top: MediaQuery.of(context).size.height * 0.015,    
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFedf3fc),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                        ))
                    ],
                  ),
                ),
              ),
              
            ],
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
                    bottomMenu('Riwayat', 2, true, context),
                    bottomMenu('Profil', 3, false, context),
                  ],
                )
              ],
            ),
          )),
        ));
  }
  void _showDialog(String judul, String alasan, MaterialPageRoute thisRoute) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Permission(
        title: judul,
        description: alasan,
        falseException: 'Batal',
        trueException: 'Hapus',
        route: thisRoute,
        method: hapusData(widget.list[widget.index]['id']),
      ),
    );
  }
}



Widget isianText(String Teks, String C, String P,String Perh, BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Text(
        "${Teks}",
        style: TextStyle(
          fontFamily: 'Varela',
          fontSize: 17.5,
          color: biru,
        ),
      ),
      ),
      
      // Horisontal(),
      Text(
        " : ",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: 'Varela',
          fontSize: 17.5,
          color: biru,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.14,
        child: Row(
          children: <Widget>[
            Container(
              // width: MediaQuery.of(context).size.width * 0.12,
              child: Text(
                " ${C}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Varela',
                  fontSize: 10,
                  color: biru,
                ),
              ),
            ),
            
            // Horisontal(),
            Text(
              " x ${P}",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Varela',
                fontSize: 10,
                color: biru,
              ),
            ),
          ],
        ),
      ),
      
      
      Container(
        width: MediaQuery.of(context).size.width * 0.12,
        child: Text(
        " = ${Perh}",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Varela',
            fontSize: 10,
            color: biru,
          ),
        ),
      ),
      
    ],
  );


  
}