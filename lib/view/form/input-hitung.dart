import 'package:flutter/material.dart';
import 'package:fixproject/components/modal/alert.dart';
import 'package:fixproject/controller/PerhitunganController.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/bottom.dart';
import 'package:fixproject/layout/spaces/horisontal.dart';
import 'package:fixproject/layout/spaces/vertikal.dart';
import 'package:fixproject/view/dashboard/index.dart';
import 'package:fixproject/view/hasil/list.dart';

class FormPerhitungan extends StatefulWidget {
  FormPerhitungan({Key key, this.title}) : super(key: key);
  final String title;

  @override
  FormPerhitunganState createState() => FormPerhitunganState();
}

class FormPerhitunganState extends State<FormPerhitungan> {

  String _valProduksi;
  List _listProduksi = ["<=3 ton/ha", "<=6 ton/ha", "<=9 ton/ha", "<=12 ton/ha", "<=15 ton/ha"];

  String _valBiji;
  List _listBiji = ["bengkok", "agak bengkok", "lurus agak bengkok", "lurus", "lurus rapat"];


  String _valAkar;
  List _listAkar = ["sangat kuat", "kuat", "agak kuat","tidak kuat","sangat tidak kuat"];


  String _valWarnaDaun;
  List _listWarnaDaun = ["hijau tua","hijau", "kuning hijau", "kuning","kuning tua"];

  String _valKetahanan;
  List _listKetahanan = ["sangat tahan", "tahan", "agak tahan", "rentan", "sangat rentan"];


  PerhitunganController apiHelper = new PerhitunganController();
  

  final TextEditingController _NamaController = new TextEditingController();

  _onPressed(){
    setState(() {
      if(_NamaController.text.trim().isNotEmpty && _valProduksi.isNotEmpty){
        apiHelper.inputData(
          _NamaController.text.trim(),
          _valProduksi,
          _valBiji,
          _valAkar,
          _valWarnaDaun,
          _valKetahanan,
          );
        if(apiHelper.statusErrorMsg){
          // _showDialog(); 
          print("ERROR");  
        }else if(apiHelper.suksesMsg.contains("OK")){
          _showDialog();
        }
      }
    });
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
                    flex: 300,
                    child: Container(
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                          //   biru
                          // ]),
                          color: biru,
                          borderRadius: BorderRadius.only(
                              // bottomLeft: Radius.circular(90),
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
                        "Form Perhitungan",
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),

                      
                    ],
                  ),
                ),
              ),
              ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                      children: <Widget>[
                        
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          margin: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.025),
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              right: MediaQuery.of(context).size.width * 0.05,
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            children: <Widget>[
                              
                        _inputan(_NamaController, "Nama Bibit", TextInputType.text, Icons.loyalty, '', context),
                        Vertikal(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: biru
                            ),
                            
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ) 
                          ),
                          height: MediaQuery.of(context).size.width * 0.125,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.075
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                elevation: 1,
                                style: TextStyle(color: putih, fontSize: 20),
                                isDense: true,
                                iconDisabledColor: Colors.red,
                                icon: Icon(Icons.arrow_drop_down),
                                iconEnabledColor: biru,
                                hint: Text("Hasil Panen (t/ha)", style: TextStyle(color: biru),),
                                value: _valProduksi,
                                items: _listProduksi.map((value) {
                                  return DropdownMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        HorisontalQuarter(),
                                        Text(value, style: TextStyle(color: biru),)
                                      ],
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valProduksi = value;  //Untuk memberitahu _valProduksi bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                  });
                                },
                            ),
                            ],
                          )
                        ),
                        Vertikal(),



                        // DROpDOWN TWO
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: biru
                            ),
                            
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ) 
                          ),
                          height: MediaQuery.of(context).size.width * 0.125,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.075
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                elevation: 1,
                                style: TextStyle(color: putih, fontSize: 20),
                                isDense: true,
                                iconDisabledColor: Colors.red,
                                icon: Icon(Icons.arrow_drop_down),
                                iconEnabledColor: biru,
                                hint: Text("Baris Biji", style: TextStyle(color: biru),),
                                value: _valBiji,
                                items: _listBiji.map((value) {
                                  return DropdownMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        HorisontalQuarter(),
                                        Text(value, style: TextStyle(color: biru),)
                                      ],
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valBiji = value;  //Untuk memberitahu _valProduksi bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                  });
                                },
                            ),
                            ],
                          )
                        ),



                        // DROpDOWN THREEE
                        Vertikal(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: biru
                            ),
                            
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ) 
                          ),
                          height: MediaQuery.of(context).size.width * 0.125,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.075
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                elevation: 1,
                                style: TextStyle(color: putih, fontSize: 20),
                                isDense: true,
                                iconDisabledColor: Colors.red,
                                icon: Icon(Icons.arrow_drop_down),
                                iconEnabledColor: biru,
                                hint: Text("Akar", style: TextStyle(color: biru),),
                                value: _valAkar,
                                items: _listAkar.map((value) {
                                  return DropdownMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        HorisontalQuarter(),
                                        Text(value, style: TextStyle(color: biru),)
                                      ],
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valAkar = value;  //Untuk memberitahu _valProduksi bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                  });
                                },
                            ),
                            ],
                          )
                        ),

                        // DROpDOWN FOUR
                        Vertikal(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: biru
                            ),
                            
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ) 
                          ),
                          height: MediaQuery.of(context).size.width * 0.125,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.075
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                elevation: 1,
                                style: TextStyle(color: putih, fontSize: 20),
                                isDense: true,
                                iconDisabledColor: Colors.red,
                                icon: Icon(Icons.arrow_drop_down),
                                iconEnabledColor: biru,
                                hint: Text("Warna Daun", style: TextStyle(color: biru),),
                                value: _valWarnaDaun,
                                items: _listWarnaDaun.map((value) {
                                  return DropdownMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        HorisontalQuarter(),
                                        Text(value, style: TextStyle(color: biru),)
                                      ],
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valWarnaDaun = value;  //Untuk memberitahu _valProduksi bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                  });
                                },
                            ),
                            ],
                          )
                        ),


                        // DROpDOWN FIVE
                        Vertikal(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: biru
                            ),
                            
                            borderRadius: BorderRadius.all(
                              Radius.circular(10)
                            ) 
                          ),
                          height: MediaQuery.of(context).size.width * 0.125,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.075
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                elevation: 1,
                                style: TextStyle(color: putih, fontSize: 20),
                                isDense: true,
                                iconDisabledColor: Colors.red,
                                icon: Icon(Icons.arrow_drop_down),
                                iconEnabledColor: biru,
                                hint: Text("Ketahanan thd. Hama", style: TextStyle(color: biru),),
                                value: _valKetahanan,
                                items: _listKetahanan.map((value) {
                                  return DropdownMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        HorisontalQuarter(),
                                        Text(value, style: TextStyle(color: biru),)
                                      ],
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valKetahanan = value;  //Untuk memberitahu _valProduksi bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                  });
                                },
                            ),
                            ],
                          )
                        ),
                        Vertikal(),
                            Container(
                                height: MediaQuery.of(context).size.width * 0.125,
                                width: MediaQuery.of(context).size.width * 0.80,
                                margin: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width * 0.01),
                                child: new RaisedButton(
                                  onPressed: _onPressed,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)),
                                  color: biru,
                                  child: new Text(
                                    'Tambah Data',
                                    style: new TextStyle(
                                        color: Colors.white,
                                        backgroundColor: biru),
                                  ),
                                ),
                            ),
                          Vertikal(),
                            ],
                          ),
                        ),
                        
                        
                      ],
                    ),
                  ),
                ],
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
                    bottomMenu('Riwayat', 2, false, context),
                    bottomMenu('Profil', 3, false, context),
                  ],
                )
              ],
            ),
          )),
        ));
  }
    void _showDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialogAlert(
            title: "Sukses",
            description: "Berhasil Menginput Data Perhitungan",
            buttonText: "Oke",
            isBlue: true,
            routes: ListHasil(),
        )
    );
  }
}


_inputan(TextEditingController ctrl , String namaINput, TextInputType tipeTeks, IconData ikon, String satuan, BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height * 0.065,
    margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      child: TextField(
        keyboardType: tipeTeks,
        controller: ctrl,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          prefixIcon: Icon(ikon),
          suffix: Text("${satuan}"),
          labelText: "${namaINput}",
          labelStyle:
              TextStyle(fontFamily: 'Varela', fontSize: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
}