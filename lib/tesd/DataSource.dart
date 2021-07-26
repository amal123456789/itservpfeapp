import 'dart:convert';

DataSource dataSourceJson(String str) => DataSource.fromJson(json.decode(str));
String dataSourceToJson(DataSource data) => jsonEncode(data.toJson());

class DataSource {
  int idSourceSequence;
  String schemaUrl;
  String systemName;
  String systemCode;
  String descritpionSource;

  DataSource({this.idSourceSequence,  this.schemaUrl ,  this.systemName ,  this.systemCode ,  this.descritpionSource});
   factory DataSource.fromJson(Map<String,dynamic> json) => DataSource(
     idSourceSequence: json["idSourceSequence"],
     schemaUrl: json["schemaUrl"],
     systemName:  json["systemName"],
     systemCode: json["systemCode"],
     descritpionSource: json["descriptionSource"]
   ) ;

  
   Map<String, dynamic> toJson() => {
     'idSourceSequence' : idSourceSequence,
     "schemaUrl" : schemaUrl,
     "systemName" : systemName,
     "systemCode" : systemCode,
     "descriptionSource" : descritpionSource,
   };
  String get schema => schemaUrl;
  String get sysname => systemName;
  String get syscode => syscode;
  String get description => descritpionSource;



}