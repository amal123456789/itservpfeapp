import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itservpfeapp/destinationElastic/getalldata.dart';
import 'package:itservpfeapp/models/DataDestinationModel.dart';
import 'dart:convert';
class delete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteState();
  }
}

Future<DataDestinationModel> deletedatas(String ipAdressDestination, String portDestination, String descritpionDestination) async {
  var Url = "http://localhost:8383/apidatadest/deleteddatadest";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  
  return DataDestinationModel.fromJson(jsonDecode(response.body));
  
}

class deleteState extends State<delete> {
  @override
  Widget build(BuildContext context) {
    return getalldata();
  }
}