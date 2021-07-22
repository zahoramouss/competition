import 'package:flutter/material.dart';

import '../Resources/resourses.dart';
class add extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {

  }
}
class addState extends State<add>{


  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height*.07;
    double w1=MediaQuery.of(context).size.width*.14;
    double r=MediaQuery.of(context).size.height*.01;
return Container(
     height: h,
    width: w1,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Color(0xff072045),
    ),
    child:Stack(
    alignment: Alignment.center,
    children:[
    CircleAvatar(
    radius:10,
    backgroundColor: white,),
    IconButton(
    onPressed: (){},
    icon: Icon( Icons.add,color: Color(0xff707070),size: 15,)),

    ]),

    );
  }

}