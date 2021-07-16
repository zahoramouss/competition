import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
class  url extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return urlstate();
  }
}
class urlstate extends State<url>{
  TextEditingController t=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double tw=MediaQuery.of(context).size.width*.7412;
    double th=MediaQuery.of(context).size.height*.0706;
    double bw=MediaQuery.of(context).size.width*.4987;
    double bh=MediaQuery.of(context).size.height*.0625;
    double m1=MediaQuery.of(context).size.height*.0475;
    double m2=MediaQuery.of(context).size.height*.038;
    double m3=MediaQuery.of(context).size.height*.0332;
    double m4=MediaQuery.of(context).size.height*.0407;
   // double m5=MediaQuery.of(context).size.height;
  return Scaffold(
    body: Container(
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
          margin: EdgeInsets.only(top: m1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              IconButton(icon: Image.asset('assets/images/para.png'), onPressed: (){}),
             title(context,str_title,m2),
              back(context,0),

            ],
          ),
        ),
        Column(
          children:[
            text(context,str_text4,0,0 ),
            text(context,str_text5,0,0 ),

          ] ,
        ),
         Container(
           child:Image.asset('assets/images/down.png')
         ),
        Container(
          width: tw,
          height: th,
          margin: EdgeInsets.only(top: m3),
          child: TextField(
            controller: t,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: str_url,

              hintStyle: TextStyle(
               
                fontFamily: font,
                color: white,
                fontSize: 30
              ),
              filled: true,
              fillColor: blue,
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

          ),
        ),

    Container(
      margin: EdgeInsets.only(top:m4),
      width: bw,
      height:bh ,
      child: RaisedButton(
          color: yellow,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(radius1),
            side:BorderSide(color: white, width: 1),
          ),
          onPressed: (){},
          child:Text(str_keep,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 26,
              fontFamily: font,
              color: white,
            ),)),

    )
      ],
    ),

    ),
  );
  }
}