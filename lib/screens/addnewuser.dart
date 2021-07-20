import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../controller/usercontroller.dart';
class adduser extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return adduserstate();
  }}
  class adduserstate extends State<adduser>{
    TextEditingController t1=TextEditingController();
    TextEditingController t2=TextEditingController();
    TextEditingController t3=TextEditingController();
    userController us=userController();
    adduser()async{
      if(t1.text.trim().isNotEmpty&&t2.text.trim().isNotEmpty&&t3.text.trim().isNotEmpty){
       if(t2.text.trim().isNotEmpty==t3.text.trim().isNotEmpty){
         us.adduser(t1.text.trim(), t2.text.trim(),t3.text.trim()).whenComplete((){
           if(us.state){
             print('sucess');
           }
         });
         
       }else{}
      }
      else{}
    }
    //backfuction

  @override
  Widget build(BuildContext context) {
    double tw=MediaQuery.of(context).size.width*.73;
    double m1=MediaQuery.of(context).size.height*.059;
    double m2=MediaQuery.of(context).size.height*.0;
    double m3=MediaQuery.of(context).size.height*.039;
    double m4=MediaQuery.of(context).size.height*.0326;
    double m5=MediaQuery.of(context).size.height*.05;
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
     child: SingleChildScrollView(
       child:Container(

             //width: tw,
         height: MediaQuery.of(context).size.height,
       child:Column(

         children: [
           Container(
             margin: EdgeInsets.only(right: 20,top: m1),
             //width: tw,
             alignment: Alignment.topRight,
             child: IconButton(
               icon: Image.asset('assets/images/back.png',scale: 1.5,),
               onPressed: (){
                 Navigator.of(context).pushNamedAndRemoveUntil('/options',(Route<dynamic>route)=>false);
               },
             ),
           ),

           title(context,str_adduser,m2),

           text(context,str_acountname,tw,m3),

           Textfield(context,t1),
         text(context,str_password,tw,m4),

           Textfield(context,t2),
          text(context,str_confirmpassword,tw,m4),
           Textfield(context,t3),
           //button
           Container(
             margin: EdgeInsets.only(top: m4),
             child: RaisedButton(
                 color: yellow,
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(radius1),
                   side:BorderSide(color: white, width: 1),
                 ),
                 onPressed: (){
                   adduser();
                 },
                 child:Text(str_save,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                   fontSize: 30,
                   fontFamily: font,
                   color: white,
                 ),)),
           ),
            Container(
              margin: EdgeInsets.only(top: m5),
              child:Image.asset('assets/images/admin.png',scale: 2,),
            )
         ],
       ),
     ),
   ),
   ),);
  }

  }