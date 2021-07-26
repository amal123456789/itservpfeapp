import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http;
import 'package:itservpfeapp/models/Employee.dart';
import 'package:itservpfeapp/testing/EmployeeModel.dart';

    class Services {
  static const ROOT = 'http://localhost:9090/getallemployees';
  static const _CREATE_TABLE_ACTION = 'http://localhost:9090/getallemployees';
  static const _GET_ALL_ACTION = 'http://localhost:9090/getallemployees';
  static const _ADD_EMP_ACTION = 'http://localhost:9090/addemployee';
  static const _UPDATE_EMP_ACTION = 'http://localhost:9090/updateemployee';
  static const _DELETE_EMP_ACTION = 'http://localhost:9090/deleteemployee';
 
  
  /*static Future<List<Employee>> getEmployees() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(_GET_ALL_ACTION, body: map);
      print('getEmployees Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Employee> list = parseResponse(response.body);
        return list;
      } else {
        return List<Employee>();
      }
    } catch (e) {
      return List<Employee>(); // return an empty list on exception/error
    }
  }*////// worked
  static Future<List<Employee>> getEmployees() async {
    var data = await http.get('http://localhost:9090/getallemployees');
    var jsonData = json.decode(data.body);

    List<Employee> employee = [];
    for (var e in jsonData) {
      Employee employees = new Employee();
      employees.id = e["id"];
      employees.firstName = e["firstName"];
      employees.lastName = e["lastName"];
      employee.add(employees);
    }
    return employee;
  }

 
  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }
 
  // Method to add employee to the database...
  //worked
  static Future<String> addEmployee(String firstName, String lastName, BuildContext context) async {
    var Url = "http://localhost:9090/addemployee";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "firstName": firstName,
        "lastName": lastName,
      }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
  }
  }
 
  // Method to update an Employee in Database...
  ////// worked nicely
  static Future<Employee> updateEmployee(
      Employee employee, BuildContext context) async {
    var Url = "http://localhost:9090/updateemployee";
  var response = await http.put(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(employee));
  String responseString = response.body;
      
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: 'Backend Response', content: response.body);
        });
  }
}
      
  
 
  // Method to Delete an Employee from Database...
  static Future<String> deleteEmployee(String empId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_EMP_ACTION;
      map['emp_id'] = empId;
      final response = await http.post(ROOT, body: map);
      print('deleteEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }

////test test

  static Future<Employee> deleteEmployees(Employee employee) async {
  var Url = "http://localhost:9090/deleteemployee";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  return Employee.fromJson(jsonDecode(response.body));
}
}


class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
