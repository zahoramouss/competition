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
import'screens/gif.dart';
void main()async {
  //userController ty=userController();
 //await ty.deleteuser(5);
runApp(MaterialApp(

  home: login(),
  routes: {

    '/giftrule':(BuildContext context)=> gift(),
    '/login':(BuildContext context)=>login(),
    '/addUser':(BuildContext context)=>adduser(),
    '/options':(BuildContext context)=>option(),
     '/url':(BuildContext context)=>url(),
    '/gif':(BuildContext context)=>gif(),
    '/changepass':(BuildContext context)=>changepass(),
    '/users':(BuildContext context)=>showusers(),
    '/raviurl':(BuildContext context)=>integramurl(),
  }
));
}

