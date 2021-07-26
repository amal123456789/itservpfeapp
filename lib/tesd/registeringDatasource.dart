import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itservpfeapp/tesd/DataSource.dart';
import 'package:http/http.dart' as http;
class registeringDatasource extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return registeringDatasourceState();
  }

}
Future<DataSource> regiterdatasourcess(
String schemaUrl,String systemName,String systemCode,String descritpionSource,BuildContext context) async {
  var Url = "http://localhost:8383/addatasource";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "schemaUrl": schemaUrl,
        "systemName": systemName,
        "systemCode": systemCode,
        "descritpionSource": descritpionSource,

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


class registeringDatasourceState extends State<registeringDatasource>{

  final minimumPadding = 5.0;

  TextEditingController schemaUrlController = TextEditingController();
  TextEditingController systemNameController = TextEditingController();
  TextEditingController systemCodeController = TextEditingController();
  TextEditingController descritpionSourceController = TextEditingController();


  DataSource dataSource;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register data source"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
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
                        labelText: 'schema url',
                        hintText: 'Enter Your schema url',
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
                        return 'please enter your sytem name';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'System Name',
                        hintText: 'Enter Your System Name',
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
                        labelText: 'system code',
                        hintText: 'Enter system code',
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
                        labelText: 'description',
                        hintText: 'Enter description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String schema = schemaUrlController.text;
                    String systemname = systemNameController.text;
                    String systemcode = schemaUrlController.text;
                    String description = schemaUrlController.text;
                    DataSource employees =
                        await regiterdatasourcess(schema,systemname,systemcode,description,context);
                    schemaUrlController.text = '';
                    systemNameController.text = '';
                    systemCodeController.text = '';
                    descritpionSourceController.text = '';
                    setState(() {
                      dataSource = employees;
                    });
                  })
            ],
          ),
        ),
      ),
    );
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
