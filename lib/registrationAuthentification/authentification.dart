import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itservpfeapp/constants.dart';
import 'package:itservpfeapp/models/User.dart';
import 'package:itservpfeapp/pages/dashboard.dart';
import 'package:itservpfeapp/registrationAuthentification/SessionStorageService.dart';
import 'package:itservpfeapp/registrationAuthentification/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

Future<Map<String, String>> createAuthHeader() async {
    var sessionStorageService = await SessionStorageService.getInstance();
    var accessToken = sessionStorageService.retriveAccessToken();
    if (accessToken == null) {
      debugPrint("No access token in local storage found. Please log in.");
      return null;
    }
    return {"Authorization": "Bearer $accessToken"};
  }

Future<User> addEmployee(String username , String password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var Url = "http://localhost:8383/api/auth/signin";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
       "username" : username,
       
       "password" : password,
     }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    var sessionStorageService = await SessionStorageService.getInstance();
      sessionStorageService.saveAccessToken(response.body);
      sharedPreferences.getString("accessToken");
      
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body,
        );
      },
    );
  }
  }

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User reg;
  bool checked = true;
 SharedPreferences sharedPreferences;
/////// test test test 
 double _formProgress = 0;
void _showWelcomeScreen() {
  createAuthHeader();
  Navigator.of(context).pushNamed('/welcome');
}
void _updateFormProgress() {
  var progress = 0.0;
  var controllers = [
    usernameController,
    emailController,
    passwordController
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

///////




  @override
  Widget build(BuildContext context) {
    return
    
     SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0XFFF95A3B),const Color(0XFFF96713)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                stops: [0.0,0.8],
                tileMode: TileMode.mirror
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(child:Image.asset("/images/itserv.jpg",),),
                  HeightBox(10),
                  "Email Sign-IN".text.size(22).yellow100.make(),
 TextField(
                    keyboardType: TextInputType.text,
                    controller: usernameController,
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "Full name",
                       // fillColor: Colors.white,
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock, color: Colors.white70),
                        filled: true,
                        //fillColor: Colors.white,
                        labelText: "Password",
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
HStack([
                    FlatButton(
                      child: Text("Sing In"),
                      color:Colors.green[400] ,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                    
                        side : BorderSide(color: Colors.green[400])),
                        

                      onPressed: () async{
                        
                    ///String email = emailController.text;
                        String password = passwordController.text;
                        String username = usernameController.text;
                         User datas = await addEmployee( username ,password,context);
                         usernameController.text ="";
                       
                         passwordController.text='';
                         
                         setState(() {
                           reg = datas;
                           //MasterPage();
                           _showWelcomeScreen();
                         });
                         //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

                    }),
SizedBox(height: defaultPadding, width: defaultPadding,),
                    FlatButton(
                      child: Text("Cancel"),
                      color:Colors.red[900] ,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                    
                        side : BorderSide(color: Colors.red[900])),
                        

                      onPressed: () {


                    }),

SizedBox(height: defaultPadding, width: defaultPadding,),

                  ]),
                  HStack([
                    Checkbox(
                      value: checked, onChanged: (bool value) { checked=value ;},

                    ),
                    "Remember Me".text.make().py16()

                  ]),
                  HStack([
                    VxBox(child: "Get Started".text.white.makeCentered().p16()).green600.roundedLg.make(),
                  ]),
                  GestureDetector(
                    onTap: (){
                      print("Sign In");
                    },
                    child: HStack([
                      "Forgot Password?".text.white.makeCentered(),
                    ]).centered().p4(),
                  ),
                  HStack([
                    VxBox(child:  FaIcon(FontAwesomeIcons.facebookF,color: Colors.white,size: 30,).p20()).blue700.roundedFull.make(),
                    VxBox(child:  FaIcon(FontAwesomeIcons.google,color: Colors.white,size: 25,).p20()).red700.roundedFull.make().p4(),
                  ])
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
          },
          child: Container(
            height: 25,
              color: Colors.lightBlue,
              child: Center(child: "Create a new Account..! Sign Up".text.white.makeCentered())),
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
      content: Container(
        child: Text(
          this.content,
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    
    );
  }
}