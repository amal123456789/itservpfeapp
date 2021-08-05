import 'dart:convert';

import 'Role.dart';
User userJson(String str) =>
  User.fromJson(json.decode(str));
String userToJson(User data) => 
json.encode(data.toJson());
class User{
  int id;
  String username;
  String email;
  String password;
  Set roles = new Set<Role>();

  User({this.id,this.username, this.email, this.password,this.roles});

 factory User.fromJson(Map<String , dynamic> json) => User(
  id: json["id"],
  username: json["username"],
  email: json["email"],
  password: json["password"],
  roles: json["roles"],
  );
  Map<String, dynamic> toJson() => {
  'id' : id,
  "username" : username,
  "email" : email,
  "password" : password,
  "roles" : roles,

  };
  int get idd => id;
  String get usernamee => username;
  String get emaill => email;
  String get passwordd => password;
  Set<Role> get roless => roles;

}  