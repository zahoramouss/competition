import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';

class option extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return optionstate();
  }
  }
  class optionstate extends State<option>{
    b(){
      Navigator.of(context).pushNamedAndRemoveUntil('/url',(Route<dynamic>route)=>false);
    }
  @override
  Widget build(BuildContext context) {
    double m1=MediaQuery.of(context).size.height*.0592;
    double m2=MediaQuery.of(context).size.height*.0516;
    double m3=MediaQuery.of(context).size.height*.0421;
    double m4=MediaQuery.of(context).size.height*.0557;
    double m5=MediaQuery.of(context).size.height*.15;
  return Scaffold(
    body: Container(
      height:MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [Color(0xffCA2FE0),Color(0xfffb8c33)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          back(context,m1,b),
          title(context,str_options,m2),
          button(context,str_adduser,m3,1),
          button(context,str_adminchangepass,m4,2),
          button(context,str_showusers,m4,3),
          Container(
            margin:EdgeInsets.only(top: m5),
            child: Image.asset('assets/images/admin.png'),
          )
        ],
      ),
    ),
  );
  }

  }