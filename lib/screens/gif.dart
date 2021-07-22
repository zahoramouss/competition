import'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:video_player/video_player.dart';
class gif extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return gifstate();
  }
}
class gifstate extends State<gif>{

@override
  void initState() {
    // TODO: implement initState
   super.initState();
   Future.delayed( const Duration(milliseconds: 33000),
           () => "2").then((onValue) {
             print('hi');
     Navigator.of(context).pushNamedAndRemoveUntil('/url',(Route<dynamic>route)=>false);
   });
  }
  @override

  Widget build(BuildContext context) {
    timeDilation=2.5;
   // GifController controller= GifController(vsync: this,duration: new Duration(milliseconds: 1200),frameCount: 32);
 return Scaffold(
   body: Container(


     child: Center(
       child:Image.asset('assets/images/giff.gif'),)




 ));
  }
}