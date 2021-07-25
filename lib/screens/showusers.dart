import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../controller/usercontroller.dart';
import '../models/user.dart';
import 'dart:convert';
class showusers extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return showstate();
  }}
  class showstate extends State<showusers>{
    userController us=userController();
    List<User>l= List<User>();
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
    @override
  void initState() {
      super.initState();
      us.showusers().then((value){
        setState(() {
          l=value;
        });
      });
  }
    b(){
      Navigator.of(context).pushNamedAndRemoveUntil('/options',(Route<dynamic>route)=>false);
    }
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
                 onPressed:()async{
                   Navigator.of(context).pushNamedAndRemoveUntil('/addUser',(Route<dynamic>route)=>false);
                 }),
           back(context,0,b)
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
            child: (l.length==0)?Center(child:   Theme(data: Theme.of(context).copyWith(accentColor:purple),
      child:CircularProgressIndicator() ,)):ListView.builder(

              itemCount:l.length,
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
                              child: Text('${l[p].username}',style: TextStyle(
                                fontFamily: fntAdobe,
                                fontSize: 30,
                                color: black,
                              ),),
                            ),
                            Container(
                              child: IconButton(
                                icon:Image.asset('assets/images/delete.png'),
                                onPressed: ()async{
                                  await us.deleteuser(l[p].id);

                                 setState(() {
                                   l.removeAt(p);
                                   print(l.length);

                                 });
                                 await us.deleteuser(l[p].id);

                                },
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