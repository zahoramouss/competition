import 'dart:convert';

import'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';


class userController{

  String url='https://winner-api.herokuapp.com/api';
  String token='';
  bool state;
  ////login
  Loginuser(String name,String pass)async{
    String myUrl='$url/login';
    int p=1;
   try{
     http.Response res =await http.post(myUrl,
         headers: {
           'Authorization':'application/json'
         },
         body:{
           "name":'$name',
           "password": '$pass',
           "remember_me" : '1'
         }

     );
     var data = json.decode(res.body);
      state=data['success'];
     token=data["data"]["token"];
     print(token);
     await save(token);
   }
   catch(e){
     print(e.toString());
   }

  }
  ////add user
  adduser(String name,String pass)async{
    String myUrl='$url/register';
    http.Response res =await http.post(myUrl,
        headers: {
          'Authorization':'application/json'
        },
        body:{
          "name":"lina2",
          "password": "123456789",
          "c_password" : "123456789"
        }

    );
    var data = json.decode(res.body);
    print(data);
  }
/////delete user
  deleteuser(int id)async{
    String myUrl='$url/deleteUser/$id';
    String t=await read();
    print('token is $t');
    try{
      http.Response res =await http.post(myUrl,
          headers: {
            'Accept':'application/json',
            'Authorization':'Bearer $t'
          }
      );
      var data=json.decode(res.body);
      print (token);
      print(data);
    }
    catch(e){}
}
////show all users
  showusers()async{
   String myUrl='$url/showUsers';
   http.Response res=await http.post(myUrl,
   headers: {
     'Accept':'application/json',
     'Authorization':'Bearer $token'
   }
   );
   var data=json.decode(res.body);
   print (token);
   print(data);
}
//// changeAdmin password
 chanceAdminpas(String pass,String reppass)async{
    String myUrl='$url/';
    http.Response res=await  http.post(myUrl,
        headers:{
          'Accept':'application/json',
          'Authorization':'Bearer $token'
        },
      body: {
        "password": "$pass",
        "c_password": "$reppass"
      }
    );
    var data=json.decode(res.body);
}

////save token
  save(String token) async {
    final value = token;
    final pret = await SharedPreferences.getInstance();
    final key = 'tokenn';
    pret.setString(key, value);
  }
  ////read token
  read() async {
    final pret = await SharedPreferences.getInstance();
    final key = 'tokenn';
    String value = pret.get(key)?? 'kkk';
    print('read : $value') ;
    return value;
  }


}