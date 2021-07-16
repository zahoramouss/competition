import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
class showusers extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return showstate();
  }}
  class showstate extends State<showusers>{
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width*.81;
    double h=MediaQuery.of(context).size.height*.70;
    double m1=MediaQuery.of(context).size.height*.0358;
    double m2=MediaQuery.of(context).size.height*.0267;
    double m3=MediaQuery.of(context).size.height*.046;
    double indent=MediaQuery.of(context).size.width*.0617;
    double mleft=MediaQuery.of(context).size.width*.0663;
    double mright=MediaQuery.of(context).size.width*.0529;
    double muser=MediaQuery.of(context).size.width*.054;
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
        children: [
       Container(
         margin: EdgeInsets.only(right: mright,left: mleft,top: m1),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             IconButton(icon: Image.asset('assets/images/add.png'),
                 onPressed: (){}),
           back(context,0)
           ],
         ),
       ),
          title(context,str_showusers,m2),
          Container(
            width: w,
            height: h,
            margin: EdgeInsets.only(top: m3),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(radius2),
            ),
            child: ListView.builder(

              itemCount: 12,
              itemBuilder: (BuildContext context,int p){
                return Container(
                 // alignment: Alignment.topCenter,
                  //color: yellow,
                  child: Column(children: [
                    Container(

                        margin: EdgeInsets.only(left: muser,right: 8),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Container(
                              child: Text('@asma',style: TextStyle(
                                fontFamily: font,
                                fontSize: 30,
                                color: black,
                              ),),
                            ),
                            Container(
                              child: IconButton(
                                icon:Image.asset('assets/images/delete.png'),
                                onPressed: (){},
                              ),
                            )
                          ],)),
                    Divider(endIndent:indent,indent:indent,thickness: 2,),
                  ],),
                );
              },
            ),
          )

        ],
      ),
    ),


  );
  }


  }