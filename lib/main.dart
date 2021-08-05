import 'dart:convert';

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
import 'package:itservpfeapp/migration/displayfiles.dart';
import 'package:itservpfeapp/migration/migration.dart';
import 'package:itservpfeapp/models/Role.dart';
import 'package:itservpfeapp/models/User.dart';
//import 'package:itservpfeapp/logssql/drawerlog.dart';
//import 'package:itservpfeapp/logssql/implementationLog.dart';
import 'package:itservpfeapp/pages/dashboard.dart';
import 'package:itservpfeapp/pages/mainSecondScreen.dart';
import 'package:itservpfeapp/property/drawer.dart';
import 'package:itservpfeapp/propertyElastic/propertyElasticDrawer.dart';
import 'package:itservpfeapp/registrationAuthentification/registration.dart';
import 'package:itservpfeapp/responsive.dart';
import 'package:itservpfeapp/sourcePropElastic/sourcePropElasticDrawer.dart';
import 'package:itservpfeapp/sourceprop/drawer.dart';
import 'package:itservpfeapp/tabview.dart';
import 'package:itservpfeapp/tesd/drawerDatasource.dart';
import 'package:itservpfeapp/testing/DataTableDemo.dart';
import 'package:itservpfeapp/testing/employeeDrawer.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'MenuController.dart';
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
    return MaterialApp(
      routes: {
        '/home': (context) => MainSecondScreen(),
        '/welcome': (context) => MainSecondScreen(),
      },
    );
  }
}

/*class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
Future<User> addEmployee(String username, String email, String password,String roles, BuildContext context) async {
    var Url = "http://localhost:8383/api/auth/signup";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
       "username" : username,
       "email" : email,
       "password" : password,
       "roles" : roles,
  
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

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
bool checked = true;
  Set<Role> roles = {};
 //List<Role> rr = roles.toList();
 
  TextEditingController rolesController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User reg;
RoleE role;
  double _formProgress = 0;
void _showWelcomeScreen() {
  Navigator.of(context).pushNamed('/welcome');
}
void _updateFormProgress() {
  var progress = 0.0;
  var controllers = [
    _firstNameTextController,
    _lastNameTextController,
    _usernameTextController,
    ///rolesController,
    //usernameController,
    //emailController,
   // passwordController
  ];

  for (var controller in controllers) {
    if (controller.value.text.isNotEmpty) {
      progress += 1 / controllers.length;
    }
  }

  setState(() {
    _formProgress = progress;
  });
}

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,  // NEW
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Sign up', style: Theme
              .of(context)
              .textTheme
              .headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.blue;
              }),
            ),
             onPressed: _formProgress == 1 ? _showWelcomeScreen : null, // UPDATED
             child: Text('Sign up'),
            ),


            
        ],
      ),
    );
  }
}*/

