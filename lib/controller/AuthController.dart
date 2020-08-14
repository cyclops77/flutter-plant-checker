import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fixproject/api/res.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Auth{
  var hasAlready;
  var statusErrorMsg;

  registCas(String email, String password, String name) async {
    String thisUrl = "$url/registerApi";
    final response = await http.post(thisUrl, headers: {
      'Accept': 'application/json'
    }, body: {
      "email": "$email",
      "name": "$name",
      "password": "$password",
    });
    statusErrorMsg = response.body.contains('error');
    var data = json.decode(response.body);
    print(response.body);
    if (statusErrorMsg) {
      print('data : ${data["error"]}');
    } else {
      
    }
  }
  loginCas(String email, String password) async {
    String thisUrl = "$url/loginApi";
    final response = await http.post(thisUrl,
      headers: {
      'Accept': 'application/json'
      },
      body: {
      "email": "$email",
      "password": "$password",
    });
    statusErrorMsg = response.body.contains('error');
    var data = json.decode(response.body);
    if (statusErrorMsg) {
      print('data : ${data["error"]}');
    } else {
      print('USERS : ${data["user"]}');
      print('data : ${data["token"]}');
      print('user : ${data["name"]}');
      SharedPreferences locale = await SharedPreferences.getInstance();
      locale.setString('user', json.encode(data['user']));
      _saveName(data["name"]);
      _save(data["token"]);
    }
  }

  changeData(String nama, String email) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String thisUrl = "$url/change-data-api";
    final response = await http.post(thisUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value',
    }, body: {
      'email': "$email",
      'name': "$nama",
    });
    final response2 = await http.post(thisUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value',
    }, body: {
      'email': "$email",
      'name': "$nama",
    });
    var data = json.decode(response2.body);
    hasAlready = response.body.contains('already');
    if(hasAlready){
      print('this email has already used');
    }else{
      SharedPreferences locale = await SharedPreferences.getInstance();
      locale.setString('user', json.encode(data['user']));
      print('data : ${data}');
    }

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