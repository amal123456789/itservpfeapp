import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DataSource.dart';
import 'deletingDtasource.dart';
import 'drawerDatasource.dart';
import 'updatingDatasource.dart';

class gettingDatasource extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     
    return getAllDatasourcingState();
  }

}
 class getAllDatasourcingState extends State<gettingDatasource>{

   var employess = List<DataSource>.generate(200, (index) => null);

  Future<List<DataSource>> getAllDatas() async {
    var data = await http.get('http://localhost:8383/getalldatasource');
    var jsonData = json.decode(data.body);

    List<DataSource> datasource = [];
    for (var e in jsonData) {
      DataSource datasourcess = new DataSource();
      datasourcess.idSourceSequence= e["idSourceSequence"];
      datasourcess.schemaUrl = e["schemaUrl"];
      datasourcess.systemName = e["systemName"];
      datasourcess.systemCode = e["systemCode"];
      datasourcess.descritpionSource = e["descritpionSource"];
      datasource.add(datasourcess);
    }
    return datasource;
  }


  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width * 0.6;

     return Scaffold(
      appBar: new AppBar(
        title: new Text("All Dtasourcess Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => drawerDatasource()));
          },
        ),
        elevation: 0,
      ),
      body: Container(
        child: FutureBuilder(
          future: getAllDatas(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Icon(Icons.error)));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(

                    onTap: (){
                      showDialogFunc(context, snapshot.data[index]);
                    },
                    child: Card(child: Row(
                      children: <Widget>[
                        Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: ListTile(
                      title: Text('ID' + '     ' + 'Schema url' + '     ' + 'System Name'+'  '+ 'System Code'+'   '+ 'Description'),
                      subtitle: Text('${snapshot.data[index].idSourceSequence}' +
                          '${snapshot.data[index].schemaUrl}' +
                          '${snapshot.data[index].systemName}' +
                          '${snapshot.data[index].systemCode}' +
                          '${snapshot.data[index].descritpionSource}'),
                        ),
                         ), ],
                     ),
                     )
                     ],
                  



                      ),),
                      /*child: ListTile(
                      title: Text('ID' + '     ' + 'Schema url' + '     ' + 'System Name'+'  '+ 'System Code'+'   '+ 'Description'),
                      subtitle: Text('${snapshot.data[index].idSourceSequence}' +
                          '${snapshot.data[index].schemaUrl}' +
                          '${snapshot.data[index].systemName}' +
                          '${snapshot.data[index].systemCode}' +
                          '${snapshot.data[index].descritpionSource}'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    showDialogFunc(context, snapshot.data[index])));
                      },*/
                    );
                  
                });
          },
        ),
      ),
    );
  }
}



class DetailPage extends StatelessWidget {
  DataSource dataSource;

  DetailPage(this.dataSource);

  deleteDatasource1(DataSource employee) async {
    final url = Uri.parse('http://localhost:8383/deletedatasource');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(employee);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataSource.schemaUrl),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => updatingDatasource(dataSource)));
              }),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text('schemaUrl' +
                ' ' +
                dataSource.schemaUrl +
                ' ' +
                'systemName' +
                dataSource.systemName +
                'systemCode' +
                ' ' +
                dataSource.systemCode +
                ' ' +
                'descritpionSource' +
                ' ' +
                dataSource.descritpionSource ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deleteDatasource1(dataSource);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => deletingDtasource()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

showDialogFunc(context,DataSource data) {
  //DataSource dataSource;
  deleteDatasource1(DataSource employee) async {
    final url = Uri.parse('http://localhost:8383/deletedatasource');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(employee);
    final response = await request.send();
  }
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  
                ),
               Container(
                 child: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => updatingDatasource(data)));
              }),


               ),
               Container(
        child: Column(
          children: [
            Text('schemaUrl' +
                ' ' +
                data.schemaUrl +
                ' ' ),
              SizedBox(height: 10),
                Text(
                'systemName' +
                data.systemName 
                ),
                Text( 'systemCode' +
                ' '+
                data.systemCode +
                ' ' ),
                Text(
                'descritpionSource' +
                ' ' +
                data.descritpionSource ),
                IconButton(icon: Icon(
                Icons.delete,
                color: Colors.amber,
              ),
              onPressed: () {
                
                    deleteDatasource1(data);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => deletingDtasource()));
              }),
          ],
        ),
      ),
              ],
            ),
          ),
        ),
      );
    },
  );
}