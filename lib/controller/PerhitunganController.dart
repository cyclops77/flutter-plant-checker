import 'package:http/http.dart' as http;
import 'package:fixproject/api/res.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PerhitunganController{
  
  var statusErrorMsg;
  var suksesMsg;

  inputData(String namaTanaman, String produksi, String biji, String akar, String warna, String ketahanan) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    String thisUrl = "$url/hitung";
    final response = await http.post(thisUrl,
      headers: {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $value'
      },
      body: {
      "namaTanaman": "$namaTanaman",
      "produksi": "$produksi",
      "biji": "$biji",
      "akar": "$akar",
      "warna": "$warna",
      "ketahanan": "$ketahanan",
    });
    statusErrorMsg = response.body.contains('error');
    suksesMsg = "OK";
  }

  delete(int id) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    String thisUrl = "$url/delete/$id";
    final response = await http.get(thisUrl,
      headers: {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $value'
      },);
    statusErrorMsg = response.body.contains('error');
    suksesMsg = "OK";
  }


  Future<bool> _saveName(String namanya) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", namanya);
    return prefs.commit();
  }

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("name");

    return name;
  }
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
}