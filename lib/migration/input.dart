
import 'dart:convert';

input inputJson(String str) =>
 input.fromJson(json.decode(str));
String inputToJson (input data) => 
json.encode(data.toJson());



class input{
  String all;
  input({this.all});
  factory input.fromJson(Map<String, dynamic> json) => input (all: json["all"]);
  Map<String , dynamic> toJson() => {
    "all" : all
  };
  String get alll => all;
}