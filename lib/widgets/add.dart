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