import 'dart:io';
import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../models/champion.dart';
import 'package:image_picker/image_picker.dart';
class winner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return winnerstate();

  }
}
class winnerstate extends State<winner>{
  List l=[false, false,false, false,false, false,false, false,false, false,false, false];
  List<Competitor> y=[Competitor('@hamied','hi',false,null),Competitor('@zaho','goodluck',false,null),Competitor('@aymen','hi',false,null),Competitor('@mohamed','takecre',false,null),Competitor('@zaki','helloloya',false,null),Competitor('@mohamed','takecre',false,null)];
  File imageFile;
  final picker=ImagePicker();
  chooseim(ImageSource source)async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile.path);
      setState(() {
        im=imageFile;

      });
      (im==null)?print('isnill'):print('not null');
    });
  }

  b(){
    Navigator.of(context).pushNamedAndRemoveUntil('/url',(Route<dynamic>route)=>false);
  }

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
    double mw3=MediaQuery.of(context).size.width*.27;


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
                back(context,0,b),
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
              itemCount: y.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                         Container(
                           margin: EdgeInsets.only(left: mw1,right: mw2),
                           child:  GestureDetector(
                             onTap: ()async{
                               chooseim(ImageSource.gallery);
                               y[index].img=await chooseim(ImageSource.gallery);

                               (im==null)?print('isnill'):print('not null');
                             },
                             child: Image.asset('assets/images/img.png',),
                           ),
                         ),
                        /*GestureDetector(
                                 onTap: (){
                                setState(() {
                                  y[index].isWin=!y[index].isWin;
                                });
                                 },
                                 child: CircleAvatar(
                                   radius: 7.5,
                                   backgroundColor: ( y[index].isWin)?Colors.blue : Colors.red,
                                 )
                             ),*/
                         IconButton(icon: Icon(Icons.circle,color:( y[index].isWin)?Colors.blue : Colors.red ,size: 15,),
                             onPressed: (){setState(() {
                           y[index].isWin=!y[index].isWin;
                         });}),
                          Align(
                                 alignment: Alignment.centerRight,
                          child:Container(
                          margin: EdgeInsets.only(left: mw3),
                           //color:black,
                           child: Text(y[index].username,
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
                onPressed: (){
                  (imageFile==null)?print('isnill'):print('not null');
                  Navigator.of(context)
                      .pushReplacementNamed('/raviurl');
                },
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