import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';

Widget Textfield(context,TextEditingController t){
  double tw=MediaQuery.of(context).size.width*.7412;
  double th=MediaQuery.of(context).size.height*.0706;
  return Container(
    width: tw,
    height: th,
    child: TextField(
      controller: t,
      decoration: InputDecoration(
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
  );
}
Widget text(context,String t,double w,double m){
  return  Container(
    margin: EdgeInsets.only(top: m),
   // width:w,
    //alignment: Alignment.topRight,
    // color: yellow,
    child: Text(t,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontFamily: font,
        fontSize: 31,
        color: white,
      ),),
  );



}
Widget back(context,double m){
  return Container(
    margin: EdgeInsets.only(right: 20,top: m),
    //width: tw,
    alignment: Alignment.topRight,
    child: IconButton(
      icon: Image.asset('assets/images/back.png'),
      onPressed: (){},
    ),
  );
}
Widget title(context,String t,double m){
  return Container(
    //color: Colors.red,
    margin: EdgeInsets.only(top: m),
    alignment: Alignment.center,
    child: Text(t,style: TextStyle(
      fontFamily: font,
      fontSize: 51,
      color: white,
    ),),
  );
}
Widget button(context,String t,double m){
  double tw=MediaQuery.of(context).size.width*.7412;
  double th=MediaQuery.of(context).size.height*.0706;
  return Container(
    margin: EdgeInsets.only(top: m),
    width: tw,
    height:th ,
    child: RaisedButton(
      color: blue,
      shape: RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(radius1),
    side:BorderSide(color: white, width: 1),
  ),
      onPressed: (){},
      child:Text(t,
     textAlign: TextAlign.right,
    style: TextStyle(
    fontSize: 26,
    fontFamily: font,
      color: white,
  ),)),

  );


}