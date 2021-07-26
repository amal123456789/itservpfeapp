import 'package:itservpfeapp/tesd/DataSource.dart';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itservpfeapp/tesd/drawerDatasource.dart';

class updatingDatasource extends StatefulWidget {
  DataSource dataSource;

  @override
  State<StatefulWidget> createState() {
     return updatingDatasourceState(dataSource);
   }
  updatingDatasource(this.dataSource);
}

Future<DataSource> updateDatas(
    DataSource dataSource, BuildContext context) async {
  var Url = "http://localhost:8383/updatedatasource";
  var response = await http.put(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(dataSource));
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

class updatingDatasourceState extends State<updatingDatasource>{


DataSource dataSource;
  final minimumPadding = 5.0;
  TextEditingController dataNumber;
  bool _isEnabled = false;
  TextEditingController schemaUrlController;
  TextEditingController systemNameController;
  TextEditingController descritpionSourceController;
  TextEditingController systemCodeController;
  Future<List<DataSource>> datasources;

  updatingDatasourceState(this.dataSource) {
    dataNumber = TextEditingController(text: this.dataSource.idSourceSequence.toString());
    schemaUrlController = TextEditingController(text: this.dataSource.schemaUrl);
    systemNameController = TextEditingController(text: this.dataSource.systemName);
    systemCodeController = TextEditingController(text: this.dataSource.systemCode);
    descritpionSourceController = TextEditingController(text: this.dataSource.descritpionSource);
  
  
  }



  @override
  Widget build(BuildContext context) {
   TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
   return Scaffold(
        appBar: AppBar(
          title: Text('Update data'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => drawerDatasource()));
            },
          ),
        ),
        body: Container(
            child: Padding(
                padding: EdgeInsets.all(minimumPadding * 2),
                child: ListView(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: dataNumber,
                        enabled: _isEnabled,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please sequence id';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'sequence ID',
                            hintText: 'Enter squence ID',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: schemaUrlController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please enter schema url';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Schema url',
                            hintText: 'Enter Schema url',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: systemNameController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please enter system name';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'System Name',
                            hintText: 'Enter System Name',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: systemCodeController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please enter system code';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'System Code',
                            hintText: 'Enter System Code',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: descritpionSourceController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please enter description';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Enter Description',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),


                  ElevatedButton(
                      child: Text('Update Details'),
                      onPressed: () async {
                        String schemaUrl = schemaUrlController.text;
                        String systemName = systemNameController.text;
                        String systemCode = systemCodeController.text;
                        String descritpionSource = descritpionSourceController.text;
                        DataSource emp = new DataSource();
                        emp.idSourceSequence= dataSource.idSourceSequence;
                        emp.schemaUrl = schemaUrlController.text;
                        emp.systemName = systemNameController.text;
                        emp.systemCode = systemCodeController.text;
                        emp.descritpionSource = descritpionSourceController.text;
                        DataSource employees =
                            await updateDatas(emp, context);
                        setState(() {
                          dataSource = employees;
                        });
                      })
                ]))));
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
