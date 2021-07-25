import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../controller/usercontroller.dart';
import '../widgets/add.dart';
import'../screens/url.dart';
class login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return loginstate();
  }

}
class loginstate extends State<login>{
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  userController us=userController();
  log()async{
  if(username.text.trim().isNotEmpty&&password.text.trim().isNotEmpty){
    us.Loginuser(username.text.trim(),password.text.trim()).whenComplete((){
       if(us.state){
       print('${us.state} is');
       Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new url(isadmin: us.g)));}
       else{
         showdial(context,'تاكد من كلمة السر واسم المستخدم');
        }

    });
  }
  else{
    showdial(context,'الرجاء ملأ مل الحقول');
  }
  }

  @override
  Widget build(BuildContext context) {
    double tw=MediaQuery.of(context).size.width*.90;
    double btw=MediaQuery.of(context).size.width*.50;
    double bth=MediaQuery.of(context).size.height*.07;
    double m1=MediaQuery.of(context).size.height*.03;
    double m2=MediaQuery.of(context).size.height*.014;
    double m3=MediaQuery.of(context).size.height*.0054;
    double m4=MediaQuery.of(context).size.height*.0108;
    double m5=MediaQuery.of(context).size.height*.032;
    double m6=MediaQuery.of(context).size.height*.036;
    double m7=MediaQuery.of(context).size.height*.039;
   return Scaffold(
     backgroundColor: Colors.transparent,
     //resizeToAvoidBottomInset: false,
     body:SingleChildScrollView(
       child: Container(
         child:
     Container(
     alignment: Alignment.center,
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration(
             gradient:LinearGradient(
               colors: [Color(0xffCA2FE0),Color(0xfffb8c33)],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
             ),
           ),
           child: SingleChildScrollView(
             child: Container(
               //tw
               width:tw ,
             height: MediaQuery.of(context).size.height,
             //color: Colors.amber,
             child:SingleChildScrollView(
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: m1),
                     child: Text(str_hello,
                     style: TextStyle(
                       fontSize: 70,
                       fontFamily: fntAdobe,
                       color: white,
                       fontWeight: FontWeight.w600,



                     ),),
                   ),
                   Container(
                     margin: EdgeInsets.only(top: m2, bottom: 10),
                     child: Text(
                         '$str_text1 $str_text2 $str_text3',
                         textAlign: TextAlign.center,
                       style: TextStyle(
                         
                       fontFamily: fntAdobe,
                       fontSize: 26,
                       color: white,
                           fontWeight: FontWeight.w200
                     ),),
                     ),
/*
                   Container(
                     child: Text( str_text2,style: TextStyle(
                       fontFamily: fntAdobe,
                       fontSize: 28,
                       color: white,
                       fontWeight: FontWeight.w200
                     ),),),

                   Container(
                     child: Text(str_text3,
                     style: TextStyle(
                       fontFamily: fntAdobe,
                       fontSize: 28,
                       color: white,
                     ),),
                   ),*/
                   Container(
                     margin: EdgeInsets.only(top: m3),
                       alignment: Alignment.topRight,
                     child:Text(str_acountname,style: TextStyle(
                       fontFamily: fntAdobe,
                       fontSize: 29,
                       color: white,

                     ),),),

                   Container(child: Textfield(context,username),),
                   Container(
                     margin: EdgeInsets.only(top: m5),
                     alignment: Alignment.topRight,
                       child:Text(str_password,style: TextStyle(
                         fontFamily: fntAdobe,
                         fontSize: 29,
                         color: white,)
                   ),),
                   Textfield(context,password),
                  /*    Container(
                        //margin: EdgeInsets.only(top:m6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(str_rememberme,style: TextStyle(
                                fontSize: 28,
                                fontFamily: font,
                                color: white),),
                            Container(
                              color: white,
                              child:Checkbox(
                                focusColor: white,
                                hoverColor: white,

                                value: false, onChanged: (value){
                                setState(() {
                                  value=true;
                                });
                              },

                              ),

                            )

                          ],
                        ),
                      ),*/
                 ////button
                 Container(
                   margin: EdgeInsets.only(top: m7),
                   width:btw ,
                   height: bth,

                   child:   RaisedButton(
                     color: yellow,
                       shape: RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(radius1),
                          side:BorderSide(color: white, width: 1),
                       ),
                       onPressed: (){
                         log();
                       },
                       child:Text(str_login,
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 29,
                         fontFamily: fntAdobe,
                         color: white,
                       ),)),
                 )
                 ],
               ),
             ),
           ),
           ),

     ),
       ),
     )
   );
  }

}