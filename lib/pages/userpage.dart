
 /* signInToken(String email , String pass) async {
    String url = "http://localhost:8383/api/test/user";
SharedPreferences sh = await SharedPreferences.getInstance();
Map body = {"" : email, "password" : pass};
var jsonResponse ;
var res = await http.get(url, headers: body);
if(res.statusCode ==200){
  jsonResponse =  json.decode(res.body);
  print("rsponse status : $res.statusCode ");
  print("response $res.body");
  if (jsonResponse != null){
    setState(() {
      _isloading = false;
    });
    sh.setString("token", jsonResponse["token"]);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false );
  }
}
else {
  setState(() {
    _isloading = false;
  });
  print("response $res.body");
}
  } */
