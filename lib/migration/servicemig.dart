import 'package:http/http.dart'
    as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:itservpfeapp/migration/input.dart';
class servicemig {
   static const migrateDatasource = 'http://localhost:8383//apilogsmigration/migrate';
  static const MigrateLogs = 'http://localhost:8383/getallemployees';



static Future<String>  getMigration() async {
    var data = await http.get('http://localhost:8383//apilogsmigration/migrate');
    var jsonData = json.decode(data.body);
String responseString = data.body;
    if (data.statusCode == 200){
      return 'data sucessufulley migrated';
    }
    return "data can not be migratetd";
  }

  static Future<String>  getfileforMigration() async {
    var data = await http.get('http://localhost:8383//apilogsmigration/getfile');
    var jsonData = json.decode(data.body);
String responseString = data.body;
    if (data.statusCode == 200){
      return 'file sucessufulley getted';
    }
    return "file can not be getted";
  }

 static Future<List<input>> getInputs() async {
    var data = await http.get('http://localhost:8383//apilogsmigration/gettfile');
    var jsonData = json.decode(data.body);

    List<input> employee = [];
    for (var e in jsonData) {
      input employees = new input();
      employees.all = e["all"];
      employee.add(employees);
    }
    return employee;
 }
  static Future<List<input>> getThefiles() async {
    var data = await http.get('http://localhost:8383//apilogsmigration/aa');
    var jsonData = json.decode(data.body);

  List<input> employee = [];
    for (var e in jsonData) {
      input employees = new input();
      employees.all = e.toString();
      employee.add(employees);
    }
    return employee;
  }






  

  



}