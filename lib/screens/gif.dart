import'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' show timeDilation;
class gif extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return gifstate();
  }
}
class gifstate extends State<gif>{
//VideoPlayerController controller;
Future <void> inialazed;
@override
void dispose() {
  //  controller.dispose();
    super.dispose();
  }
@override
  void initState() {
  //  controller=VideoPlayerController.asset('assets/images/v.mp4');
   // inialazed=controller.initialize();
 /*   WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
   //  controller.setVolume(0);
      // Plays the video once the widget is build and loaded.
   //  controller.play();
  //   print('hhhhhhhhhhhhh');
    });*/

   super.initState();
   Future.delayed( const Duration(milliseconds: 9000),
           () => "2").then((onValue) {
             print('hi');
     Navigator.of(context).pushNamedAndRemoveUntil('/listWinners',(Route<dynamic>route)=>false);
   });
  }
  @override

  Widget build(BuildContext context) {
   // timeDilation=2.5;
   // GifController controller= GifController(vsync: this,duration: new Duration(milliseconds: 1200),frameCount: 32);
 return Scaffold(
   body:Container(


     child: Center(
     child:Image.asset('assets/images/giff.gif'),)




    ),
   /*Center(
   /**/
   child:FutureBuilder(
     future: inialazed,
     builder: (context,snapshot){
       if (snapshot.connectionState==ConnectionState.done){
         return AspectRatio(aspectRatio: controller.value.aspectRatio,
         child: VideoPlayer(controller),);
       }else{
         print('fail');
       }
     },
   )
   )
   */);


  }
}