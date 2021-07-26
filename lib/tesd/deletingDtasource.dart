import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:itservpfeapp/datasource/datasourceDrawer.dart';
import 'package:itservpfeapp/tesd/drawerDatasource.dart';

import 'DataSource.dart';
import 'gettingDatasource.dart';

class deletingDtasource extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deletingDtasourceState();
  }

}

Future<DataSource> deleteDtasources(String schemaUrl, String systemName, String systemCode , String descripion) async {
  var Url = "http://localhost:8383/deletedatasource";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  return DataSource.fromJson(jsonDecode(response.body));
}
class deletingDtasourceState extends State<deletingDtasource>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return gettingDatasource();
  }

}
/*class deletingDtasourceState extends State<deletingDtasource>{
  @override
  Widget build(BuildContext context) {
    return drawerDatasource();
  }

}*/