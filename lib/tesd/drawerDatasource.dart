import 'package:flutter/material.dart';
import 'package:itservpfeapp/tesd/registeringDatasource.dart';

import 'gettingDatasource.dart';

class drawerDatasource extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return drawerDatasourceState();
  }
}

class drawerDatasourceState extends State<drawerDatasource> {
  final minimumPadding = 5.0;
 List<bool> _isOpen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data management"),
      ),
      body: Center(child: Text("datasource management welcome here")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('data Management'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Register data'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registeringDatasource()));
              },
            ),
            ListTile(
              title: Text('Get datass'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => gettingDatasource()));
              },
            )
          ],
        ),
      ),
    );
  }

}