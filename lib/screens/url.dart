import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../screens/getwinner.dart';
class  url extends StatefulWidget{
  final isadmin;

  const url({Key key, this.isadmin}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
 return urlstate();
  }
}
class urlstate extends State<url>{

  TextEditingController t=TextEditingController();
  b(){
    //Navigator.of(context).pushNamedAndRemoveUntil('/options',(Route<dynamic>route)=>false);
  }
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
     // resizeToAvoidBottomInset: false,
    body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
        gradient:LinearGradient(
        colors: [Color(0xffCA2FE0),Color(0xfffb8c33)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      ),
      ),
      child:Container(
        height:MediaQuery.of(context).size.height,
      child:SingleChildScrollView(
      child:Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: m1, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ( widget.isadmin==1)?IconButton(icon: Image.asset('assets/images/para.png'), onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('/options',(Route<dynamic>route)=>false);
                }):Container()
                ,
               title(context,str_title,m2),
                back(context,0,b),

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
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(

                  fontFamily: fntAdobe,
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
            onPressed: (){
              final f=t.text.trim();
              Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new winner(url:f)));
            },
            child:Text(str_keep,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 26,
                fontFamily: fntAdobe,
                color: white,
              ),)),

      )
        ],
      ),

      ))),
    )
  );
  }
}