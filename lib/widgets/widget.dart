import 'package:flutter/material.dart';

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
Widget button(context,String t,double m,int choice){
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
      onPressed: (){
        switch(choice){

        }

      },
      child:Text(t,
     textAlign: TextAlign.right,
    style: TextStyle(
    fontSize: 26,
    fontFamily: font,
      color: white,
  ),)),

  );


}
Widget gtext(context,double imw,String s,bool pro){
  double h=MediaQuery.of(context).size.height*.05;
  return Container(
    width: imw,
    height: pro?h:0,
    //color: yellow,
    alignment: Alignment.centerRight,
    child: Text(s,
        textAlign: TextAlign.end,
        style: TextStyle(
            fontSize: 19,
            fontFamily: font,
            color: black
        )),
  );
}
Widget sel(context,double h,double w,String s,bool pro){
  return Container(
    height:pro? h:0,
    width: w,
    decoration: BoxDecoration(
        color: gray3,
        borderRadius: BorderRadius.circular(
            radius4)
    ),
    child: TextField(

         textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontFamily: font,
            fontSize: 18,
            color: gray2
        ),
        hintText: s,
        prefixIcon: Image.asset('assets/images/poly.png'),
        filled: true,
        fillColor: gray3,
        contentPadding: EdgeInsets.only(top: 0,right: 10,left: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius4)),
          borderSide: BorderSide(
            color:white,
            width:1,
          ),),
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius4)),
          borderSide: BorderSide(
            color:white,

          ),),
          ),






    ),
  );
}
Widget nbcount(context,String s){
  double h =MediaQuery.of(context).size.height*.0665;
  double w1=MediaQuery.of(context).size.width*.1307;
  return Container(
    height:h ,
    width:w1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: w,
    ),
    child: Align(
      alignment: Alignment.center,
      child: Text(s, textAlign:TextAlign.center,style: TextStyle(
        fontFamily: font,
        fontSize: 20,
        color:black,
      ),),
    )

  );
}
Widget addw( BuildContext context,onPressed,bool d){
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
        onPressed: onPressed,
        icon: (d)?Icon( Icons.add,color: Color(0xff707070),size: 15,):Icon( Icons.remove,color: Color(0xff707070),),
      ),
    ]),

  );
}