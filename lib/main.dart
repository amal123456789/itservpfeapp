import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itservpfeapp/constants.dart';
import 'package:itservpfeapp/datasource/datasourceDrawer.dart';
import 'package:itservpfeapp/datasource/drawerdata.dart';
import 'package:itservpfeapp/destinationElastic/destinationElasticdrawer.dart';
import 'package:itservpfeapp/elasticdatasource/dataDrawerE.dart';
import 'package:itservpfeapp/logssql/implementationLog.dart';
import 'package:itservpfeapp/migration/migration.dart';
//import 'package:itservpfeapp/logssql/drawerlog.dart';
//import 'package:itservpfeapp/logssql/implementationLog.dart';
import 'package:itservpfeapp/pages/dashboard.dart';
import 'package:itservpfeapp/property/drawer.dart';
import 'package:itservpfeapp/propertyElastic/propertyElasticDrawer.dart';
import 'package:itservpfeapp/sourcePropElastic/sourcePropElasticDrawer.dart';
import 'package:itservpfeapp/sourceprop/drawer.dart';
import 'package:itservpfeapp/tabview.dart';
import 'package:itservpfeapp/tesd/drawerDatasource.dart';
import 'package:itservpfeapp/testing/DataTableDemo.dart';
import 'package:itservpfeapp/testing/employeeDrawer.dart';
import 'package:url_strategy/url_strategy.dart';

import 'datadestinationsql/drawer.dart';
import 'logssql/getall.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ITSERV application',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme).apply(bodyColor: Colors.white),
      ),
      initialRoute: '/home',
      getPages: [
      GetPage(name: '/:page_name', page: () => MasterPage()),
    ],
       
      //home: Home(),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
class MasterPage extends StatelessWidget{
  Widget view;
    MasterPage() {
    Map<String, Widget> InterRoutes=
    {'home':Dashboard(),
    'datasource' :datasourceDrawer(),
    'elasticdatasource': dataDrawerE(),
    'employee': employeeDrawer(),
    '5raaaaaa':drawerDatasource(),
    'tabbar': MyTabbedPage(),
    'datadestination': drawerd(),
    'property' : drawer(),
    'sourceprop' :drawerS(),
    'elasticdatadestination' : destinationElasticdrawer(),
    'propertyElastic' : propertyElastic(),
    'sourceproperties' : sourcePropElasticDrawer(),
    'testnewcrud' : DataTableDemo(),
    'seeLogs' : imlementationLog(),
    'migrationData' : migrationLog(),
    'logelastic' : imlementationLogelastic()
    //drawerlog()
    
    
    };

  view=InterRoutes[Get.parameters['page_name']];

  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      body: SafeArea(
        child: Row(
            children: [
              ////////////////////test test test tst test video
              Expanded(
              child: SideBar(),
              ),
             /* Expanded(
                child: Container(
                  decoration: BoxDecoration(
          color: Colors.blue,
         borderRadius: BorderRadius.circular(20.0),
        ),
                  //color: Colors.blue,
                  child: Column(
                    
                    children: [
                      Container(
                        width: double.maxFinite ,
                        
                        child: DrawerHeader(
                          child: CircleAvatar(
                            child: Icon(
                              CupertinoIcons.profile_circled,
                              size: 60,
                            ),
                          ),),
                      ),
                      ExpansionTile(
                        title: Text("SQL Management"),
                        //backgroundColor: Colors.amber.shade100,
                        trailing: Icon(Icons.menu_open),
                      

                        children: [
                           ListTile(
                          hoverColor: Colors.black12 ,
                          leading: Icon(Icons.menu),
                          title: Text("Data source"),
                          
                          
                          onTap: (){
                            Get.toNamed("/datasource");
                          },
                          
                        ),
                      
                      SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("Data Destination"),
                        onTap: (){
                          Get.toNamed("/datadestination");
                        },
                      
                      ),
                      SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("Property Management"),
                        onTap: (){
                          Get.toNamed("/property");
                        },
                      
                      ),SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("Source Property Management"),
                        onTap: (){
                          Get.toNamed("/sourceprop");
                        },
                      
                      ),SizedBox(height: 2,),
                      /*ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("Employee Management"),
                        onTap: (){
                          Get.toNamed("/employee");
                        },
                      
                      ),SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("5ra"),
                        onTap: (){
                          Get.toNamed("/5raaaaaa");
                        },
                      
                      ),
                      SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("tabbar"),
                        onTap: (){
                          Get.toNamed("/tabbar");
                        },
                      
                      ),*/
                      

                      ],
                      ),
                      ExpansionTile(
                        title: Text("Elasticsearch Management"),
                        //backgroundColor: Colors.amber.shade100,
                        trailing: Icon(Icons.menu_book_outlined),
                      

                        children: [
                           ListTile(
                          hoverColor: Colors.black12 ,
                          leading: Icon(CupertinoIcons.doc_append),
                          title: Text("Data source "),
                          
                          
                          onTap: (){
                            Get.toNamed("/elasticdatasource");
                          },
                          
                        ),
                      
                      SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.doc_append),
                        title: Text("Data Destination Management"),
                        onTap: (){
                          Get.toNamed("/elasticdatadestination");
                        },
                      
                      ),
                      SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.doc_append),
                        title: Text("Properties Management"),
                        onTap: (){
                          Get.toNamed("/propertyElastic");
                        },
                      
                      ),SizedBox(height: 2,),
                      ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.doc_append),
                        title: Text("Source properties Management"),
                        onTap: (){
                          Get.toNamed("/sourceproperties");
                        },
                      
                      ),
                      SizedBox(height: 2,),
                      /*ListTile(
                        hoverColor: Colors.black12 ,
                        leading: Icon(CupertinoIcons.square_favorites_alt),
                        title: Text("tabbar"),
                        onTap: (){
                          Get.toNamed("/tabbar");
                        },
                      
                      ),*/
                      

                      ],
                      ),

                    ],
                  ) ,


                  )),*/
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Column(
                    children: [
                      Header(),
                      //SizedBox(height: defaultPadding,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: defaultPadding,),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                //Myfiles(),
                                //SizedBox(height: defaultPadding,),
                                /*GridView.builder(////// im stopped here 
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: demoMyFields.length,
                              
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: defaultPadding,
                                  ), 
                                  itemBuilder: (context,index) => GridCardInfo(info: demoMyFields[index],),
                                  ),*/
                                

                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                  height: 600,
                                    child: view
                                   ),
                                ),
                              ],
                                ),),
                                SizedBox(width: defaultPadding,),
                                Expanded(
                                flex: 2 ,
                                child: StoragePart()),
                           
                        ],
                      ),
                    ],
                  ),
              ))
            ],
          ),


        
        
      ),
    );
    
  }
  
}

class GridCardInfo extends StatelessWidget {
  const GridCardInfo({
    Key key, this.info,
  }) : super(key: key);

final CloudStorageInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))

      ) ,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(info.svgSrc, color: info.color, ),
              )
            ],
          )
        ],

      ),


    );
  }
}

class StoragePart extends StatelessWidget {
  const StoragePart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Storage Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: defaultPadding),
            Chart(),
            StorageInfoCard(
              svgSrc:"/images/icons/Documents.svg" ,
              title: "Documents Files",
              amountOfFiles: "1.3GB",
              numOfFiles: 1329,
              ),
              /*StorageInfoCard(
              svgSrc:"/images/icons/media.svg" ,
              title: "Media Files",
              amountOfFiles: "15.3GB",
              numOfFiles: 1329,
              ),*/
              StorageInfoCard(
              svgSrc:"/images/icons/folder.svg" ,
              title: "Other Files",
              amountOfFiles: "1.3GB",
              numOfFiles: 1329,
              ),
              StorageInfoCard(
              svgSrc:"/images/icons/unknown.svg" ,
              title: "Unknown",
              amountOfFiles: "1.3GB",
              numOfFiles: 1329,
              ),

          ],),
      );
  }
}

class Myfiles extends StatelessWidget {
  const Myfiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("My Files",
     style: Theme.of(context).textTheme.subtitle1),
    ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: defaultPadding)),
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text("Add New")),

    ],);
  }
}

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    Key key, 
    @required this.title, 
    @required this.svgSrc, 
    @required this.amountOfFiles, 
    @required this.numOfFiles,
  }) : super(key: key);
final String  title, svgSrc , amountOfFiles;
final int numOfFiles;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2, 
          color: primaryColor.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(Radius.circular(defaultPadding))
      
      ),
      child: Row(children: [
        SizedBox(
          height: 20 , 
          width: 20 ,
          child: SvgPicture.asset(svgSrc),),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),
             Text("$numOfFiles Files", style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white70),),
      
      ],
      ),
        )
      ),
      Text(amountOfFiles)
      
      ],),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
            sections: PieChartSelectionData,
          )),
          Positioned.fill(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
            SizedBox( height: defaultPadding,),
            Text(
              "29.1" ,
               style: Theme.of(context)
               .textTheme
               .headline4
               .copyWith(color: Colors.white,
               fontWeight:FontWeight.w600 ,
               height: 0.5,
            )),
            Text("of 128GB")
          ],))
        ],
      ),
    
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
        width: 25,),
        Text("Dashbord",
        style: Theme.of(context).textTheme.headline6 ,),
        Spacer(flex: 2,),
        Expanded(
          child: 
          SearchField()),
          ProfileCard(),
          
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric( 
        horizontal: defaultPadding , 
        vertical: defaultPadding / 2),
      decoration: BoxDecoration(color: secondaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.green),
      ) ,
      child: Row(
        children: [
          Image.asset(
            "/images/itserv.jpg", 
            height: 38,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2),
              child: Text("login User space"),
            ),
            Icon(Icons.keyboard_arrow_down),




        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      
    decoration: InputDecoration(
      hintText: "Search",

      fillColor: secondaryColor,
      filled: true, 
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: 
        const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2 ),
          decoration: BoxDecoration(color: primaryColor) ,
          child: SvgPicture.asset("/images/icons/Search.svg"),
          ),
        )
        ),
                      );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
            child: Image.asset("/images/itserv.jpg",
            
            
            ),
            ),
            DrawerListTile(title: "Data Source",
            svgSrc: "/images/icons/menu_dashbord.svg",
            press: (){
            Get.toNamed("/datasource");
          },),
          DrawerListTile(title: "Data Destination",
            svgSrc: "/images/icons/menu_tran.svg",
            press: (){
            Get.toNamed("/datadestination");
          },),
            DrawerListTile(title: "LOGS",
            svgSrc: "/images/icons/menu_store.svg",
            press: (){
            Get.toNamed("/seeLogs");
          },),
          DrawerListTile(title: "Migration",
            svgSrc: "/images/icons/menu_task.svg",
            press: (){
           Get.toNamed("/migrationData");
          },),
          
          DrawerListTile(title: "Source Prop",
            svgSrc: "/images/icons/menu_doc.svg",
            press: (){
           Get.toNamed("/sourceprop");
          },),
          DrawerListTile(title: "LogElastic",
            svgSrc: "/images/icons/menu_store.svg",
            press: (){
           Get.toNamed("/logelastic");
          },),
          
           DrawerListTile(
            title: "Notification",
            svgSrc: "/images/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "/images/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "/images/icons/menu_setting.svg",
            press: () {},
          ),
            ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    
    Key key,
    this.svgSrc,
    this.title,
    this.press,

  }) : super(key: key);
  final String title,svgSrc;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
          horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc ,
         color: Colors.black,
         height: 16,
         ),
      title: Text(title,
      style: TextStyle(color: Colors.blueAccent),),
    );
  }
}
List<PieChartSectionData> PieChartSelectionData = [
                                              PieChartSectionData(
                                                color: color1,
                                                value: 25,
                                                showTitle: false,
                                                radius: 25,
                                                ),
                                                PieChartSectionData(
                                                color: color2,
                                                value: 20,
                                                showTitle: false,
                                                radius: 22,
                                                ),
                                                PieChartSectionData(
                                                color: color3,
                                                value: 10,
                                                showTitle: false,
                                                radius: 19,
                                                ),
                                                PieChartSectionData(
                                                color: color4,
                                                value: 15,
                                                showTitle: false,
                                                radius: 16,
                                                ),
                                                PieChartSectionData(
                                                color: Colors.lightGreen,
                                                value: 5,
                                                showTitle: false,
                                                radius: 13,
                                                ),
                                                
                                                
                                              

                                            ];

 class CloudStorageInfo {
   final String svgSrc , title, totalStorage;
   final  int numOfFields , pourcentage;
   final Color color;
   CloudStorageInfo({
     this.svgSrc,
     this.title,
     this.totalStorage,
     this.numOfFields,
     this.pourcentage,
     this.color
   });
 }

List demoMyFields = [
  CloudStorageInfo(
    title:"Documents",
    numOfFields: 1329,
    svgSrc: "/images/icons/Documents.svg",
    totalStorage : "1.9GB",
    color: primaryColor,
    pourcentage : 35,

  ),
CloudStorageInfo(
    title:"Google Drive",
    numOfFields: 1329,
    svgSrc: "/images/icons/google_drive.svg",
    totalStorage : "1.9GB",
    color: Colors.amber,
    pourcentage : 35,

  ),
  CloudStorageInfo(
    title:"Cloud",
    numOfFields: 1329,
    svgSrc: "/images/icons/one_drive.svg",
    totalStorage : "1.9GB",
    color: Colors.pink,
    pourcentage : 35,

  ),

];



                                        