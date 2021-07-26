import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:itservpfeapp/models/PropertiesModel.dart';
import 'package:itservpfeapp/propertyElastic/getalldata.dart';

class delete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteState();
  }
}

Future<PropertiesModel> deletedatas(String schemaUrl, String systemName, String systemCode , String descripion) async {
  var Url = "http://localhost:8383/apiproperties/deleteprop";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  
  return PropertiesModel.fromJson(jsonDecode(response.body));
  
}

class deleteState extends State<delete> {
  @override
  Widget build(BuildContext context) {
    return getalldata();
  }
}
