import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itservpfeapp/constants.dart';
import 'package:itservpfeapp/models/Role.dart';
//import 'package:itservpfeapp/models/Role.dart';
import 'package:itservpfeapp/models/User.dart';
import 'package:itservpfeapp/registrationAuthentification/authentification.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
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
 
class _RegistrationState extends State<Registration> {
  bool checked = true;
  Set<Role> roles = {};
 //List<Role> rr = roles.toList();
 
  TextEditingController rolesController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User reg;
RoleE role;

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  "CREATE YOUR ACCOUNT".text.size(22).yellow100.make(),
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
                    keyboardType: TextInputType.text,
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "Email",
                        //fillColor: Colors.white,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText : 'Password',
                        filled: true,
                        //fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: rolesController,
                    decoration: InputDecoration(
                      labelText: 'Roles',
                        filled: true,
                        //fillColor: Colors.white,
                        hintText: "Admin , moderateur, user",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  ///test radi for roles
                HStack([
                    Checkbox(
                      value: checked, onChanged: (bool value) { checked=value ;},

                    ),
                    "Agree & Continue".text.make().py16()

                  ]),
                  HStack([
                    FlatButton(
                      child: Text("Register"),
                      color:Colors.green[400] ,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                    
                        side : BorderSide(color: Colors.green[400])),
                        

                      onPressed: () async{
                        String username = usernameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String roles = rolesController.text ;
                         User datas = await addEmployee(username , email ,password, roles,context);
                         usernameController.text='';
                         emailController.text='';
                         passwordController.text='';
                         rolesController.text ='';
                         setState(() {
                           reg = datas;
                         });

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



                  ]),
                  /*HStack([
                    VxBox(child: "Cancel".text.white.makeCentered().p16()).red600.roundedLg.make().px16().py16(),
                    VxBox(
                      child: "Register".text.white.makeCentered().p16()).green600.roundedLg.make().px16().py16(),
                  
                  ]),*/
                  SizedBox(height: defaultPadding, width: defaultPadding,),

                  GestureDetector(
                    onTap: (){
                      print("Sign In");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                    },
                    child: HStack([
                      "Already Registered?".text.make(),
                      " Sign In".text.white.make()
                    ]).centered(),
                  )
                ],
              ),
            ),
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
