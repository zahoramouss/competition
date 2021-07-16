import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
class winner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return winnerstate();

  }
}
class winnerstate extends State<winner>{
  List l=[false, false,false, false,false, false,false, false,false, false,false, false];
  @override
  Widget build(BuildContext context) {
    double bw=MediaQuery.of(context).size.width*.50;
    double bh=MediaQuery.of(context).size.height*.0625;
    double cw=MediaQuery.of(context).size.width*.8377;
    double ch=MediaQuery.of(context).size.height*.5217;
    double ch1=MediaQuery.of(context).size.height*.0448;
    double cw1=MediaQuery.of(context).size.width*.3607;
    double m1=MediaQuery.of(context).size.height*.024;
    double m2=MediaQuery.of(context).size.height*.038;
    double m3=MediaQuery.of(context).size.height*.0543;
    double indent=MediaQuery.of(context).size.width*.0508;
    double mw1=MediaQuery.of(context).size.width*.0576;
    double mw2=MediaQuery.of(context).size.width*.0121;
    double mw3=MediaQuery.of(context).size.width*.3802;


  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [Color(0xffCA2FE0),Color(0xfffb8c33)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child:Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: m1),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [

                Container(
                  height: ch1,
                  width: cw1,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 50),
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(radius1) ,
                    color: blue,
                   border:Border.all(color: white,
                   width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                     Image.asset('assets/images/coin.png') ,
                      Text(str_choice,textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: font,
                        color: white,
                      ),),


                    ],
                  ),
                ),
                back(context,0),
              ],
            )
          ),
          title(context,str_cnames,m2),
          Container(
            height: ch,
              width: cw,
            margin: EdgeInsets.only(top: m3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius2),
              color: white,
            ),
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                         Container(
                           margin: EdgeInsets.only(left: mw1,right: mw2),
                           child:  GestureDetector(
                             onTap: (){},
                             child: Image.asset('assets/images/img.png',scale: 1.5,),
                           ),
                         ),
                       GestureDetector(
                                 onTap: (){
                                setState(() {
                                  l[index]=!l[index];
                                });
                                 },
                                 child: CircleAvatar(
                                   radius: 7.5,
                                   backgroundColor: ( l[index])?Colors.blue : Colors.red,
                                 )
                             ),


                         Expanded(child:  Container(
                           margin: EdgeInsets.only(left: mw3),
                           child: Text('@ahmed',
                             style: TextStyle(
                               fontFamily: font,
                               fontSize: 27,
                               color: black,
                             ),),
                         ))
                        ],
                      ),
                      Divider(
                        color: black,
                        endIndent: indent,indent: indent,
                       // height: 1,

                      )
                    ],
                  )
                );
              },
            ),
          ),
          Container(
            width:bw ,
            height: bh,
            margin: EdgeInsets.only(top: m1),
            child:   RaisedButton(
                color: yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(radius1),
                  side:BorderSide(color: white, width: 1),
                ),
                onPressed: (){},
                child:Text(str_start,style: TextStyle(
                  fontSize: 30,
                  fontFamily: font,
                  color: white,
                ),)),
          ),
          Container(
            margin: EdgeInsets.only(top: m2),
            alignment: Alignment.center,
            child: Text('$str_note1 \n     $str_note2',style: TextStyle(
              fontFamily: font,
              fontSize: 18,
              color: white,

            ),),
          ),
        ],
      ),
    ),
  );



  }
}