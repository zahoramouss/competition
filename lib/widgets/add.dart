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