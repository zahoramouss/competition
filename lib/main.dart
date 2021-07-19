import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/addnewuser.dart';
import 'screens/changepassword.dart';
import 'screens/options.dart';
import 'screens/showusers.dart';
import 'screens/url.dart';
import 'screens/getwinner.dart';
import 'screens/rinstegramurl.dart';
import 'screens/giftrules.dart';
import 'controller/usercontroller.dart';

void main()async {
  //userController ty=userController();
 //await ty.deleteuser(5);
runApp(MaterialApp(

  home: login(),
  routes: {
    '/compet': (BuildContext context) => winner(),
    '/giftrule':(BuildContext context)=> gift(),
    '/login':(BuildContext context)=>login(),
    '/adduser':(BuildContext context)=>adduser(),
    '/options':(BuildContext conytext)=>option(),
     '/url':(BuildContext context)=>url(),
      '/win':(BuildContext context)=>winner(),
  }
));
}
