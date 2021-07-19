import 'package:flutter/cupertino.dart';

import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';

class gift extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return giftstate();
  }
}

class giftstate extends State<gift> {
  int groupv = 0;
  bool isSwitched = false;
  int nbwinner = 1;
  String str_win = 'الفائزون';
  String str_wi = 'الفائزون البدلاء';
  TextEditingController t = TextEditingController();
  bool pro = false;
  int nbwin=0;
  tap() {
    setState(() {
      pro = !pro;
      print(pro);
    });
  }
   pressadd(){
    setState(() {
      nbwin=nbwin+1;

    });
    print(nbwin);
   }
   pressmin(){
    setState(() {
      nbwin=nbwin-1;
    });
   }
  @override
  Widget build(BuildContext context) {
    double cradius = MediaQuery.of(context).size.width * .0263;
    double cw = MediaQuery.of(context).size.width * .0944;
    double ch = MediaQuery.of(context).size.height * .0366;
    double m1 = MediaQuery.of(context).size.height * .061;
    double m2 = MediaQuery.of(context).size.height * .0475;
    double imh = MediaQuery.of(context).size.height * .42;
    double imw = MediaQuery.of(context).size.width * .86;
    double ih = MediaQuery.of(context).size.height * .09;
    double tf1w = MediaQuery.of(context).size.width * .8498;
    double tf1h = MediaQuery.of(context).size.height * .0502;
    double btnh = MediaQuery.of(context).size.height * .0679;
    double btnw = MediaQuery.of(context).size.width * .8450;
    double slh = MediaQuery.of(context).size.height * .05;
    double slw = MediaQuery.of(context).size.width * .4019;
    double c = MediaQuery.of(context).size.width * .138;
    double ma1 = MediaQuery.of(context).size.height*.0118;
    double ma2 = MediaQuery.of(context).size.height * .037;
    double ma3 = MediaQuery.of(context).size.height * .027;
    double ma4 = MediaQuery.of(context).size.height * .0557;
    double ma5 = MediaQuery.of(context).size.height * .046;
    return Scaffold(
      body: Container(
        color: white,
        child: Column(
          children: [
            ////header
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: m1, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: cw,
                    height: ch,
                    decoration: BoxDecoration(
                        color: purpleravi,
                        borderRadius: BorderRadius.circular(9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '8',
                          style: TextStyle(
                              fontFamily: font, color: white, fontSize: 17),
                        ),
                        Image.asset('assets/images/crown.png'),
                      ],
                    ),
                  ),
                  Text(
                    str_gift,
                    style:
                        TextStyle(fontSize: 24, color: black, fontFamily: font),
                  ),
                  /*CircleAvatar(
                  radius:cradius ,
                  backgroundColor: Color(0xffefefef),
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.close_rounded,size: 20,color: black,),
                  ),
                ),*/
                  Image.asset('assets/images/close.png'),
                ],
              ),
            ),

            Expanded(
                child: SingleChildScrollView(
                    // scrollDirection: Axis.vertical,
                    child: Center(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //img
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: imh,
                      width: imw,
                      margin: EdgeInsets.only(top: m2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xff707070),
                          )),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          child:(im!=null)?Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(im)
                              )
                            ),
                          )
                         : Image.asset(
                            'assets/images/dog.jpg',
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        //margin: EdgeInsets.only(top: (imh)),
                        height: ih,
                        width: imw,
                        decoration: BoxDecoration(
                            color: Color(0xa6000000),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            )),
                      ),
                    )
                  ],
                ),
                Container(
                  width: imw,
                  height: 88,
                  child: Row(
                    children: [
                      Container(
                        width: imw / 2,
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            //top: BorderSide(width:3, color: Colors.lightBlue.shade600),
                            bottom: BorderSide(
                                width: 3, color: (pro) ? purple5 : white),
                          ),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: tap,
                          child: Text(
                            str_giftpro,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: font,
                                color: (pro) ? purple5 : gray2,
                                fontSize: 19),
                          ),
                        ),
                      ),
                      Container(
                        width: imw / 2,
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            //top: BorderSide(width:3, color: Colors.lightBlue.shade600),
                            bottom: BorderSide(
                              width: 3,
                              color: (pro) ? white : purple5,
                            ),
                          ),
                          //color: Colors.red,
                        ),
                        child: GestureDetector(
                          onTap: tap,
                          child: Text(
                            str_giftbase,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: font,
                                color: (pro) ? gray2 : purple5,
                                fontSize: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //color: grey,
                  margin: EdgeInsets.only(right: 0),
                  alignment: Alignment.centerRight,
                  width: imw,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 10),
                      )),
                      Text(
                        'تسجيل على الشاشة',
                        style: TextStyle(
                            fontSize: 19, fontFamily: font, color: gray2),
                      ),
                      Radio(
                        activeColor: Color(0xff0c294b),
                        groupValue: groupv,
                        value: 1,
                        onChanged: (value) {
                          setState(() {
                            groupv = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                //
                Container(
                  width: imw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Switch(
                        value: isSwitched,
                        activeColor: gray2,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                      ),
                      Text('عنوان المسابقة',
                          style: TextStyle(
                              fontFamily: font, fontSize: 19, color: black)),
                    ],
                  ),
                ),
                Container(
                  height: tf1h,
                  width: tf1w,
                  child: TextField(
                    //controller: t,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: str_tgift,
                      hintStyle: TextStyle(
                          fontFamily: font, fontSize: 19, color: gray2),
                      contentPadding: EdgeInsets.only(top: 0, right: 12),
                      fillColor: gray3,
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(radius1)),
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(radius1)),
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
                ////
                Container(
                  width: imw,
                  alignment: Alignment.centerRight,
                  child: Text(str_winner,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 19, fontFamily: font, color: black)),
                ),
                ////
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: slh,
                        width: slw,
                        decoration: BoxDecoration(
                            color: gray3,
                            borderRadius: BorderRadius.circular(radius4)),
                        child: Builder(
                          builder: (context) => GestureDetector(
                            onTap: () {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                    content: Container(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: yellow,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32),
                                                topRight: Radius.circular(32)))
                                        // width: ,
                                        )),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/images/poly.png'),
                                Text(
                                  str_wi,
                                  style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 18,
                                      color: gray2),
                                ),
                              ],
                            ),
                          ),
                        )),

                    ///
                    Container(
                      height: slh,
                      width: slw,
                      decoration: BoxDecoration(
                          color: gray3,
                          borderRadius: BorderRadius.circular(radius4)),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),

                                  )),
                              context: context,
                              builder: ( context) {


                                return StatefulBuilder(
                                     builder: (BuildContext context, StateSetter setState) {
                                       double bth=MediaQuery.of(context).size.height*.0665;
                                       double btw=MediaQuery.of(context).size.width*.4358;
                                return Container(
                                  height:MediaQuery.of(context).size.height*.4524 ,
                                  width:MediaQuery.of(context).size.width ,



                                 // color:Colors.transparent,
                                  child:
                                    Container(
                                    /*  decoration: BoxDecoration(
                                          color:white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25),

                                          )
                                      ),*/
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ////bar
                                          Container(
                                            margin:EdgeInsets.only(top:ma1),
                                            height:MediaQuery.of(context).size.height*.0067,
                                            width: MediaQuery.of(context).size.width*.0966,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(14),
                                              color: Color(0xffcdced2)
                                            ),
                                          ),
                                          //txt of winnern numbers
                                          Container(
                                            margin: EdgeInsets.only(top: ma2),
                                            child: Text(str_putwnb,style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: font,
                                              color: black
                                            ),),
                                          ),
                                          //number choices
                                          Container(
                                            margin: EdgeInsets.only(top:ma3),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                nbcount(context,'+25'),
                                                nbcount(context,'+20'),
                                                nbcount(context,'+15'),
                                                nbcount(context,'+10'),
                                                nbcount(context,'+5'),
                                            ],),
                                          ),
                                          //add
                                          Container(
                                              //color: purple ,
                                              margin: EdgeInsets.only(top: ma4),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(

                                                  color: gray3 ,
                                                  width: MediaQuery.of(context).size.width*.46,
                                                  height: MediaQuery.of(context).size.height*.07,
                                                  child: Text('$nbwin',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    fontFamily: font1,
                                                    color: black
                                                  ),),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                  addw(context,pressadd,true),

                                                  addw(context,pressmin,false)
                                                ],),
                                              ],
                                            )
                                          ),
                                          //buttons
                                          Container(
                                            margin: EdgeInsets.only(top: ma5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //حسنا
                                                Container(
                                                  height: bth,
                                                  width: btw,
                                                  child: RaisedButton(
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                    color: purple6,
                                                    elevation: 0,
                                                    shape: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(radius5),
                                                        borderSide: BorderSide(width: 0,color: purple6)
                                                    ),
                                                    child: Text('حسنا',style:TextStyle(
                                                      fontFamily: font,
                                                      color: white,
                                                      fontSize: 24
                                                    )),

                                                  ),
                                                ),
                                                //إلغاء
                                                Container(
                                                  height: bth,
                                                  width: btw,
                                                  child: RaisedButton(
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                      setState((){
                                                        nbwin=0;
                                                      });
                                                    },
                                                    color: gray3,
                                                    shape: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(radius5),
                                                      borderSide: BorderSide(width: 0,color: gray3)
                                                    ),
                                                    child: Text('إلغاء',style:TextStyle(
                                                        fontFamily: font,
                                                        color: black,
                                                        fontSize: 24
                                                    )),

                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                );
                              });});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/images/poly.png'),
                            Text(
                              str_win,
                              style: TextStyle(
                                  fontFamily: font, fontSize: 18, color: gray2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                //
                gtext(context, imw, str_hash, pro),
                //
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sel(context, slh, slw, str_hs, pro),
                    sel(context, slh, slw, str_sign, pro),
                  ],
                )),
                gtext(context, imw, str_sh, pro),
                //
                Container(
                  height: pro ? slh : 0,
                  width: tf1w,
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: font, fontSize: 18, color: black),
                      hintText: str_lik,
                      filled: true,
                      prefixIcon: Image.asset('assets/images/poly.png'),
                      fillColor: gray3,
                      contentPadding:
                          EdgeInsets.only(top: 0, right: 10, left: 0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius4)),
                        borderSide: BorderSide(
                          color: white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius4)),
                        borderSide: BorderSide(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),

                //
                gtext(context, imw, str_c, pro),
                Container(
                  height: pro ? slh : 0,
                  width: tf1w,
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: font, fontSize: 18, color: gray2),
                      hintText: str_va,
                      filled: true,
                      prefixIcon: Image.asset('assets/images/poly.png'),
                      fillColor: gray3,
                      contentPadding:
                          EdgeInsets.only(top: 0, right: 10, left: 0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius4)),
                        borderSide: BorderSide(
                          color: white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius4)),
                        borderSide: BorderSide(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),

                //
                gtext(context, imw, str_ad, pro),
                Container(
                  height: pro ? slh : 0,
                  width: tf1w,
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: font, fontSize: 18, color: black),
                      hintText: str_second,
                      filled: true,
                      fillColor: gray3,
                      contentPadding:
                          EdgeInsets.only(top: 0, right: 10, left: 0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius4)),
                        borderSide: BorderSide(
                          color: white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(radius4)),
                        borderSide: BorderSide(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )))),
            ////button
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  Container(
                    width: btnw,
                    height: btnh,
                    child: RaisedButton(
                      color: purple3,
                      onPressed: () {},
                      child: Text(str_startg,
                          style: TextStyle(
                              fontSize: 19, fontFamily: font, color: white)),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius3),
                          borderSide: BorderSide(color: purple3)),
                    ),
                  ),
                  Container(
                    height: btnh,
                    width: c,
                    decoration: BoxDecoration(
                        color: purple4,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius3),
                          bottomLeft: Radius.circular(radius3),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(str_nbcrown,
                              style: TextStyle(
                                  fontFamily: font,
                                  color: white,
                                  fontSize: 23)),
                        ),
                        Image.asset('assets/images/crown.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
