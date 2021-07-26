import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:itservpfeapp/models/SourcePropertiesModel.dart';
import 'package:itservpfeapp/sourceprop/getall.dart';

class delete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteState();
  }
}

Future<SourcePropertiesModel> deletedatas(String value, String loginModif, String dateModif) async {
  var Url = "http://localhost:8383/deletesourceproperties";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  
  return SourcePropertiesModel.fromJson(jsonDecode(response.body));
  
}

class deleteState extends State<delete> {
  @override
  Widget build(BuildContext context) {
    return getalldata();
  }
}
