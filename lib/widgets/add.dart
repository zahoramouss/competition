import 'dart:io';

import 'package:flutter/material.dart';
import '../Resources/resourses.dart';
Widget showdial( BuildContext context,String mess){

  showDialog(context:context,builder: (BuildContext context,){
    var size=MediaQuery.of(context).size;
    return  AlertDialog(backgroundColor:Color(0xfff8f9ff),content:SingleChildScrollView(
        child:StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {

              return GestureDetector(
                  child: Container(
                      width: size.width *.8357,
                      height: size.height *.18,
                      color: Color(0xfff8f9ff),


                      child: Center(
                        child:Text('$mess',style: TextStyle( color: Colors.black,fontSize: 18,fontFamily: font),),
                      )



                  ),
                  onTap: (){
                    Navigator.pop(context);
                  }
              );
            })));}
  );}

  Widget diag(context){
    showDialog(context:context,builder: (BuildContext context,){
    var size=MediaQuery.of(context).size;
    return  AlertDialog(backgroundColor:Color(0xfff8f9ff),


        content:
        StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {

              return GestureDetector(
                  child: Container(
                      width: size.width ,
                      height: size.height *.17,
                      color: Color(0xfff8f9ff),


                      child: Column(

                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Text('معلومات',style: TextStyle(

                                color: Color(0xff666666),
                                fontWeight: FontWeight.bold,

                              ),),
                              Text('هل أنت متأكد أنك تريد أنهاء المسابقة؟ كل البيانات'
                                  '',style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff666666),
                                fontWeight: FontWeight.bold,
                              ),),
                              Text('.الخاصة فيه ستفقد'
                                ,textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],),
                          Container(
                            // margin: EdgeInsets.only(top:10),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                                children: [
                                  FlatButton(
                                      padding:EdgeInsets.only(top: 20),
                                      onPressed: (){
                                        Navigator.of(context).pushNamedAndRemoveUntil('/raviurl',(Route<dynamic>route)=>false);
                                      }, child: Text('نهاية الهدية',style: TextStyle(
                                    color: Color(0xff1007ff),
                                    fontWeight: FontWeight.bold,
                                  ),)),
                                  FlatButton(
                                      padding:EdgeInsets.only(top:20),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text('إلغاء',style: TextStyle(
                                    color: Color(0xff1007ff),
                                    fontWeight: FontWeight.bold,
                                  ),))
                                ],)

                          )
                        ],
                      )


                  ),
                  onTap: (){
                    Navigator.pop(context);
                  }
              );

            }));
  });}
  Widget cnt(context ,String name,String comment,File im){
    double ch=MediaQuery.of(context).size.height*.0923;
    double cw =MediaQuery.of(context).size.width*.8014;
    double rad=14;
    double btnh=MediaQuery.of(context).size.height*.023;
    double btnw=MediaQuery.of(context).size.width*.10;
    double circe=MediaQuery.of(context).size.height*.0692;
    double font1=MediaQuery.of(context).size.width*.0435;
    double font2=MediaQuery.of(context).size.width*.029;
  return Center(
      child:Container(
        height: ch,
        width: cw,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14)
        ),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              ////button
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.006,left: 8),
                alignment: Alignment.topLeft,
                //color: Colors.deepPurple,
                child: Row(
                  children: [
                    Container(
                      height:btnh ,
                      width:btnw ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xff564ce3)

                      ),

                      child:
                      Text('ST1',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                            color: Color(0xffffffff),
                            //  fontFamily: font,
                            fontSize: (font2>12)?12:font2
                        ),),
                    ),
                    Container(
                      child: Text(name,style: TextStyle(
                          color: Color(0xff666666),
                          //  fontFamily: font,
                          fontSize: 19
                      ),),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child:  Container(
                  //color: Colors.greenAccent,
                  alignment: Alignment.centerRight,
                  child: Row(

                    children: [
                      Container(
                        margin: EdgeInsets.only(right:13),
                        child:Text(comment,style: TextStyle(
                            color: Color(0xff666666),
                            //  fontFamily: font,
                            fontSize:(font1>18)?18:font1
                        ),),
                      ),

                      Container(child: CircleAvatar(
                        radius: circe/2,
                        backgroundColor:Colors.red,

                      ),),
                    ],
                  ),
                ),
              )

            ]
        ),

      ),
    );

  }
  Widget buttn(context){


    return Container(
        height: MediaQuery.of(context).size.height*.07,
        width: MediaQuery.of(context).size.width*.91 ,
        child:RaisedButton(
          onPressed: (){
            // Navigator.of(context).pushNamedAndRemoveUntil('/giftrule',(Route<dynamic>route)=>false);
          },
          color: Color(0xff5656ec),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide( color: Color(0xff5656ec),),
          ),
          child: Text('نهاية الهدية',
            style: TextStyle(
             fontFamily: font,
                fontSize:24 ,
                color: Color(0xffffffff)
            ),),

        )
    );
  }