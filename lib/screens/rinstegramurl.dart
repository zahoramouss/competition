import 'dart:ui';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class integramurl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return instegram();
  }
}
 class instegram extends State<integramurl>{
  TextEditingController t=TextEditingController();
  bool anim=false;
  @override
  Widget build(BuildContext context) {
    double  th=MediaQuery.of(context).size.height*.07;
    double tw=MediaQuery.of(context).size.width*.876;
    double bh=MediaQuery.of(context).size.height*.057;
    double m1=MediaQuery.of(context).size.height*.0720;
    double m2=MediaQuery.of(context).size.height*.019;
    double m3=MediaQuery.of(context).size.height*.051;
    double m4=MediaQuery.of(context).size.height*.03;
    double m5=MediaQuery.of(context).size.height*.0258;
    double m6=MediaQuery.of(context).size.height*.28;
   return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       decoration: BoxDecoration(
       gradient:   LinearGradient(
         begin:  Alignment.topCenter,
         end:Alignment.bottomCenter,
         colors: [ Color(0xffdd539e) ,Color(0xffcc34d5)]
       )

       ),
       child: Stack(children:[
       SingleChildScrollView(
         child: Column(
           children: [
             Container(
               margin: EdgeInsets.only(top:m1),
               alignment: Alignment.center,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Container(
                     child: Image.asset('assets/images/cr.png'),
                   ),
                   Container(
                     child: Image.asset('assets/images/ss.png'),
                   ),
                   Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                       children: [
                         Image.asset('assets/images/soff.png'),
                         Container(
                           padding: EdgeInsets.only(top: 3),
                           child: Image.asset('assets/images/son.png'),),
                         Text(str_setting,style: TextStyle(
                             fontFamily: fntAdobe,
                             fontSize: 9,
                             color: white
                         ),)
                       ],
                     ),
                   ),


                 ],
               ),
             ),
             Container(
               margin: EdgeInsets.only(top:m2),
               child: Image.asset('assets/images/gift.png'),
             ),
             Container(
               alignment: Alignment.topRight,
                 margin: EdgeInsets.only(top:m3,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text('$str_copyurl '
                  ,
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: fntAdobe,
                    color: white
                ),),
                Text('$str_copyurl2',
                    textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: fntAdobe,
                    color: white
                ),)
              ],)

             ),
             Container(
                 margin: EdgeInsets.only(top:m4),
               width: tw,
               height: th,

               child:TextField(
                 style: TextStyle(
                     color: black,
                     fontFamily: fntAdobe,
                     fontSize: 30
                 ),
                 controller: t,
                  textAlign: TextAlign.center,
                 decoration: InputDecoration(
                   filled: true,
                   fillColor: white,

                      contentPadding: EdgeInsets.zero,
                   hintText:'https://www.instagram.com/p/C',
                   hintStyle: TextStyle(

                     color: grey,
                     fontFamily: fntAdobe,
                     fontSize: 30
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(radius1)),
                     borderSide: BorderSide(
                       color:white,
                       width:1,
                     ),),
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(radius1)),
                     borderSide: BorderSide(
                       color:white,

                     ),),
                 ),
               )
             ),
             Container (
               width: tw,
               height: bh,
               margin: EdgeInsets.only(top: m5),
               //color: white,
               child:RaisedButton(
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(16),
                 ),
                 color: white,
                 onPressed: (){
                   setState(() {
                     anim=true;
                     Future.delayed(
                     const Duration(milliseconds: 600),
                       () => "2").then((onValue) {
                         setState(() {
                           anim=false;
                         });
                       Navigator.of(context)
                              .pushReplacementNamed('/giftrule');
                   });
                   });
                 },
                 child:Text(str_search,
                 style: TextStyle(
                   fontFamily: fntAdobe,
                   color:Color(0xff6f66dd),
                   fontSize: 25,
                 ),),
               )
             ),
             Container(
               alignment: Alignment.topLeft,
               margin: EdgeInsets.only(top: m6),
               child: Image.asset('assets/images/mess.png'),
             )
           ],
         ),
       ),
         (anim)?
         Container(

           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           color:Color(0x8cffffff),

               child:SpinKitWave(
                 duration:Duration(milliseconds: 1200) ,
                 color:purple5,
                 size: 50.0,
                 //controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),

           )

         )
             :Container()
    ])
     )
   );
  }
}