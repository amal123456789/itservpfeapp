import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itservpfeapp/datasource/getDataSource.dart';
import 'package:itservpfeapp/elasticdatasource/getDSElastic.dart';
import 'package:itservpfeapp/models/DatasourceModel.dart';


class deleteDSe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteDSeState();
  }
}

Future<DatasourceModel> deletedatas(String schemaUrl, String systemName, String systemCode , String descripion) async {
  var Url = "http://localhost:8383/apidatasource/deleteds";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  
  return DatasourceModel.fromJson(jsonDecode(response.body));
  
}

class deleteDSeState extends State<deleteDSe> {
  @override
  Widget build(BuildContext context) {
    return getDSElastic();
  }
}