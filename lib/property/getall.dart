import 'package:flutter/material.dart';
import 'package:itservpfeapp/models/PropertiesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:itservpfeapp/property/delete.dart';
import 'package:itservpfeapp/property/update.dart';
class getalldata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllDataState();
  }
}
  class getAllDataState extends State<getalldata> {
    var datas = List<PropertiesModel>.generate(200, (index) => null);

    Future <List<PropertiesModel>> getDataSource() async {
      var data = await http.get('http://localhost:8383/getallproperties');

      var jsonData = json.decode(data.body);

    List<PropertiesModel> datasource = [];
    for (var e in jsonData) {
      PropertiesModel datasources = new PropertiesModel();
      datasources.idProperty= e["idProperty"];
      datasources.propName = e["propName"];
      datasources.codeProp = e["codeProp"];
      datasources.classe = e["classe"];
      //datasources.descritpionSource =e["descritpionSource"];
      //datasources.descritpionSource = e["descritpionSource"];
      datasource.add(datasources);
      
      
    }
    return datasource;
    }

    @override
    Widget build(BuildContext context) {
       double width = MediaQuery.of(context).size.width * 0.6;

    return /*Scaffold(
      appBar: new AppBar(
        title: new Text("All Dtasourcess Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => datasourceDrawer()));
          },
        ),
      ),
      body:*/ Container(
        child: FutureBuilder(
          future: getDataSource(),
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
                      title: Text('ID' + '     ' + 'codeProp' + '     ' + 'propName'+'  '+ 'classe'),
                      subtitle: Text('${snapshot.data[index].idProperty}' +
                          '${snapshot.data[index].codeProp}' +
                          '${snapshot.data[index].propName}' +
                          '${snapshot.data[index].classe}'),
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
      );
  }
}


  
 

class DetailPage extends StatelessWidget {
  PropertiesModel datasource;

  DetailPage(this.datasource);

  deletedatas1(PropertiesModel datasource) async {
    final url = Uri.parse('http://localhost:8383/deleteproperties');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(datasource);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
            AppBar(
              title: Text(datasource.propName),
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
                              builder: (context) => update(datasource)));
                    }),
              ],
              ),
        
         body: Container(
          child: Column(
            children: [
              Text('schemaUrl' +
                  ' ' +
                  datasource.propName +
                  ' ' +
                  'systemName' +
                  datasource.codeProp +
                  'systemCode' +
                  ' ' +
                  datasource.classe  ),

            ],
          ),
         ),
                /*  IconButton(
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                     deletedatas1(datasource);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => deletedatasource()));
                    }),*/
         
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
            deletedatas1(datasource);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => delete()));
          },child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

showDialogFunc(context,PropertiesModel data) {
  //DataSource dataSource;
  deleteDatasource1(PropertiesModel employee) async {
    final url = Uri.parse('http://localhost:8383/deleteproperties');
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
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
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
                            builder: (context) => update(data)));
              }),


                   ),
                 ],
               ),
               Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('propName :' +
                    ' ' ,
                    style: TextStyle(
                color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20 ,
                    fontStyle: FontStyle.normal)),
                     Text(
                data.propName +
                ' ',
                style: TextStyle(
                color: Colors.grey[800],
                  fontWeight: FontWeight.w100,
                  fontSize: 20 ,
                    fontStyle: FontStyle.italic)
                ),
              ],
            ),
               
              SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                    'codeProp :' +' ',
                    style: TextStyle(
                color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20 ,
                    fontStyle: FontStyle.normal)),
                    Text(
                    data.codeProp ,
                    style: TextStyle(
                color: Colors.grey[800],
                  fontWeight: FontWeight.w100,
                  fontSize: 20 ,
                    fontStyle: FontStyle.italic)
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text( 'classe: ' +
                    ' ',style: TextStyle(
                color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20 ,
                    fontStyle: FontStyle.normal)),
                    Text(
                    data.classe +
                    ' ' ,style: TextStyle(
                color: Colors.grey[800],
                  fontWeight: FontWeight.w100,
                  fontSize: 20 ,
                    fontStyle: FontStyle.italic)),
                  ],
                ),
                SizedBox(height: 10),
                
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   
                    IconButton( 
                      icon: Icon( 
                    Icons.delete,
                    color: Colors.amber,
              ),
              onPressed: () {
                    
                        deleteDatasource1(data);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => delete()));
              }),
                  ],
                ),
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