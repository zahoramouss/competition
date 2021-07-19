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

void main() {
runApp(MaterialApp(

  home: integramurl(),
  routes: {
  '/home': (BuildContext context) => winner(),}
));
}

