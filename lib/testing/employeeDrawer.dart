
import 'package:flutter/material.dart';
import 'package:itservpfeapp/testing/registerEmployee.dart';

import 'getEmployees.dart';

class employeeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}

class employeeDrawerState extends State<employeeDrawer> {
  final minimumPadding = 5.0;
 List<bool> _isOpen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Management'),
      ),
      body: Center(child: Text('Welcome To PXP Channel')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('Employee Management'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Register Employee'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registerEmployee()));
              },
            ),
            ListTile(
              title: Text('Get Employees'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getemployees()));
              },
            )
          ],
        ),
      ),
    );
  }
}
