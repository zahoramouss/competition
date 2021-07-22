import 'dart:io';
import 'dart:ui';
import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../models/champion.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';
import '../models/elem_commnt.dart';
import 'package:visibility_detector/visibility_detector.dart';
class winner extends StatefulWidget{
  final url;

  const winner( {Key key, this.url}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
   return winnerstate();

  }
}
class winnerstate extends State<winner>{
  InAppWebViewController webView;
  String myurl;
  File imgh;
  ScrollController listController;

  List<Competitor> y=[Competitor('@hamied','hi',false,null),Competitor('@zaho','goodluck',false,null),Competitor('@aymen','hi',false,null),Competitor('@mohamed','takecre',false,null),Competitor('@zaki','helloloya',false,null),Competitor('@mohamed','takecre',false,null)];
  File imageFile;
  final picker=ImagePicker();
  chooseim(ImageSource source)async {
    imageCache.maximumSize=0;
    imageCache.clear();
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile.path);
      setState(() {
     io=imageFile;

      });

    });
  }

  b(){
    Navigator.of(context).pushNamedAndRemoveUntil('/url',(Route<dynamic>route)=>false);
  }

  @override
  void initState() {
    myurl = (widget.url).split('?')[0];
   String n =myurl.split('?')[0];
   print(n);
    print('myurl                        $myurl');
   // if(myurl!=null || myurl=='')
      //myurl = "https://www.instagram.com/p/CRFDbnTDRoX/";

    listController = ScrollController();
    listController = ScrollController(initialScrollOffset: 50.0);
    super.initState();
    //print ()
  }

  List<ElemComment> listUserComment = <ElemComment>[];
  int _currentItem;
  getData(controller) async{
    var html;
    controller.evaluateJavascript( source: "window.document.getElementsByTagName('html')[0].outerHTML;").then((e){
      html = e;
      var document = parse(html);
      var commnts = document.getElementsByClassName('C4VMK');
      dynamic header = document.getElementsByTagName('header');

      dynamic postOwner = "@${header[0].nodes[1].nodes[0].innerHtml.split('href=\"/')[1].split('/\"')[0]}";
      String user;
      String cmnt;
      listUserComment = <ElemComment>[];

      for(int k=0; k<commnts.length; k++)
      {
        user = '';
        cmnt = '';

        for(int i=0; i<commnts[k].nodes.length; i++)
        {
          dynamic elem = commnts[k].nodes[i];
          if(cmnt=='' && elem.localName=="span")
          {
            cmnt = elem.text;
          }
          else if(user=='' && elem.innerHtml.contains('href'))
          {
            user = elem.innerHtml.split('href=\"/')[1].split('/\"')[0];
          }
        }
        listUserComment.add(ElemComment(user:"@$user", comment:cmnt, index:k));
      }

      listUserComment.removeWhere((element) => element.user == postOwner);
      print(listUserComment.toString());

      final existing = Set<ElemComment>();
      List<ElemComment> listUserComment2 = listUserComment
          .where((element) => existing.add(element)).toList();
      print(listUserComment2.toString());
      listUserComment = listUserComment2;
      setState(() {

      });
    });
    //log(html);
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
    double mw3=MediaQuery.of(context).size.width*.05;


  return Scaffold(
    body:
    Stack(
        children: [
    Container(
    child: Column(children: <Widget>[
    Expanded(
    child: InAppWebView(
    initialUrlRequest: URLRequest(url:Uri.parse(myurl)),

    //initialHeaders: {},
    initialOptions: InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
    //  debuggingEnabled: true,
    userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0"
    ),
    ),
    onWebViewCreated: (InAppWebViewController controller) {
       webView = controller;
    },
      onLoadStart: (InAppWebViewController controller, url) {

                 },
       onLoadStop: (InAppWebViewController controller, Uri url) async {
//////













    await getData(controller);

    },
    onReceivedServerTrustAuthRequest: (InAppWebViewController controller, challenge) async {
    return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
    },
    )
    )
    ]),
    ),

    Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [Color(0xffCA2FE0),Color(0xfffb8c33)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      //child:Expanded(
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
                  child: RaisedButton(
                    onPressed: ()async{
                      await chooseim(ImageSource.gallery);
                      imgh=io;
                      if(imgh==null){
                        print('no image');
                      }else{
                        print('exist image ');
                      setState((){

                   im=imgh;

                      });
                      }
                    },
                      child:Text(str_choice,textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: font,
                        color: white,
                      ),),



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
            child: (listUserComment.length==0)?(Center(child:CircularProgressIndicator())):
            ListView.builder(
              itemCount: listUserComment.length,
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
                               await chooseim(ImageSource.gallery);
                               listUserComment[index].img= await chooseim(ImageSource.gallery);


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
                         IconButton(icon: Icon(Icons.circle,color:( (listUserComment[index].isWiner)==true)?Colors.blue : Colors.red ,size: 15,),
                             onPressed: (){

                           setState(() {
                             (listUserComment[index].isWiner==null)?(listUserComment[index].isWiner=true):
                               listUserComment[index].isWiner=!listUserComment[index].isWiner;
                         });}),
                          Align(
                                 alignment: Alignment.centerRight,
                          child:Container(
                          margin: EdgeInsets.only(left: mw3),
                           //color:black,
                           child: Text(listUserComment[index].user,
                             style: TextStyle(
                               fontFamily: font,
                               fontSize: 23,
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
                  l=listUserComment;
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
      ),]
  ));



  }
}