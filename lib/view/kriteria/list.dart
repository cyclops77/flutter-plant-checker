import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fixproject/css/rep.dart';
import 'package:fixproject/layout/bottom.dart';
import 'package:fixproject/view/hasil/detail-data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListKriteria extends StatefulWidget {
  ListKriteria({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ListKriteriaState createState() => ListKriteriaState();
}

class ListKriteriaState extends State<ListKriteria> {

  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  ListKriteriaState(){
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }
  // ApiHelper apiHelper = new ApiHelper();
  
  Map<dynamic,dynamic> data;
  List<dynamic> listHistory;
  void _getKehamilan() async {
    final prefs = await SharedPreferences.getInstance();
     final key = 'token';
     final value = prefs.get(key ) ?? 0;

     String myUrl = "http://sppk.alfian.aku.codes/api/index-kriteria";
     http.Response response = await http.get(myUrl,
     headers: {
       'Accept' : 'application/json',
       'Authorization' : 'Bearer $value'
     });
    List tempList = new List();
    final data = jsonDecode(response.body);
    for (int i = 0; i < data['data'].length; i++) {
      tempList.add(data['data'][i]);
    }
    setState(() {
      // print(tempList);
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }

  @override
  void initState() {
    super.initState();
    // getLatestKehamilan();
    _getKehamilan();
  }

  
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  Widget buildList(){
    if (!(_searchText.isEmpty ?? true) ) {
      List<dynamic> tempList= List();
      for (int i = 0; i < filteredNames.length; i++) {
        //mencari data dengan cara constains apakah sesuai dengan data
        if (filteredNames[i]['kriteria'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      
      // padding: EdgeInsets.only(top: 200),
          itemCount: names == null ? 0 : filteredNames.length,
          itemBuilder: (BuildContext context, int index){
            return _res(
              "${filteredNames[index]['kriteria']}",
              "${filteredNames[index]["c"]}",
              "${filteredNames[index]['nilai']}",
              filteredNames,
              index,
              context);
          }
    );
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
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)
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
                        "Kriteria Perhitungan",
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
    
                      
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                child: buildList(),
              ),
              
              Positioned(
                child: Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 125,
                    horizontal: 20),
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      controller: _filter,
                      decoration: InputDecoration(
                          hintText: "Cari kriteria . . .", border: InputBorder.none
                        ),
                    ),
                  )
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
  
}


_res(String kriteria,String kri,String nilai,List list,int i,BuildContext context){
  return Container(
    child: GestureDetector(
      onTap: (){},
    child: Container(
    height: 125,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.height * 0.015,    
    ),
    decoration: BoxDecoration(
      color: Color(0xFFedf3fc),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: <Widget>[
        Container(
          height: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${kriteria}", style: TextStyle(
                            color: biru,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Kriteria ${kri}", style: TextStyle(
                            color: biru,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.format_line_spacing,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Bobot ", style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Varela',
                                )),
                              ],
                            ),
                          ),
                          
                          Text("${nilai}", style: TextStyle(
                            color: biru,
                            fontSize: 15,
                            letterSpacing: 1,
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        )
      ],
    ),
 ),
    ),
  );

}