import 'package:flutter/material.dart';
import 'package:itservpfeapp/migration/input.dart';
import 'package:itservpfeapp/migration/servicemig.dart';

class migrationLog extends StatefulWidget {
  //
  migrationLog() : super();
 
  final String title = 'Migration';
 
  @override
  migrationLogState createState() => migrationLogState();

}
class migrationLogState extends State<migrationLog> {
  final minimumPadding = 5.0;
  GlobalKey<ScaffoldState> _scaffoldKey;
  String _titleProgress;
  bool _isUpdating;
  @override
  void initState() {
     super.initState();
      _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _isUpdating = false;
    //_makemig();
  }
  // Method to update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }
 
  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

/////

List<input> _list;
 _getInputss() {
    _showProgress('Loading Employees...');
    servicemig.getInputs().then((employees) {
      setState(() {
        _list = employees;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${employees.length}");
    });
  }
 



  _makemig(){
    _showProgress('migration in progress...');
    servicemig.getMigration();
  }
  _getFileconf(){
    _showProgress('Fichiers config configurez votre input datasource ...');
    servicemig.getThefiles();
  }
SingleChildScrollView _dataBody(){
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child : Text('no data'),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 100,
          width: 200,
         //color: Colors.amber,
         child : TextButton( child: Text("Fichier config ici"),
         
            onPressed: () {
              _getFileconf();
              //_getInputss();

            },),
            
         )
         ,
         
        Container(
          height: 300,
          width: 500,
          //color: Colors.blueAccent,
          child: ListView(
          padding: EdgeInsets.only(
            top: minimumPadding, 
            bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
                child: Text('Migration ',),
              
            ),
            ListTile(
              title: Text('Migrate Datasource'),
              onTap: () {
                _makemig();
               
              },
            ),
            ListTile(
              title: Text('Migrate Logs'),
              onTap: () {
                _makemig();

                
              },
            )
          ],
        ),
        ),
        _isUpdating ?
        Row(
          children: [
            
          ],
        ) : Container(),
        Expanded(child: Container(
          height: 50,
          width: 50,
          color:  Colors.pinkAccent,
         // child: _dataBody(),
          ) ),
      ],
      ),
      
      /*ListView(
          padding: EdgeInsets.only(
            top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('Migration ',),
              
            ),
            ListTile(
              title: Text('Migrate Datasource'),
              onTap: () {
                _makemig();
               
              },
            ),
            ListTile(
              title: Text('Migrate Logs'),
              onTap: () {
                _makemig();

                
              },
            )
          ],
        ),*/
      
      

    );
  }
}
/*children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child : TextButton( child: Text("Fichier config ici"),
            onPressed: () {
              _getFileconf();

            },
              
            ),
          ),*/