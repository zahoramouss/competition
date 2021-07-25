
import 'package:flutter/scheduler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';
import '../models/elem_commnt.dart';
import '../Resources/resourses.dart';
import '../Resources/Strings.dart';

class WinnersLast extends StatefulWidget {
 // final url;

//  const MyApp({Key key, this.url}) : super(key: key);
  @override
  _WinnersLastState createState() => new _WinnersLastState();
}

class _WinnersLastState extends State<WinnersLast> {
  InAppWebViewController webView;
  String myurl;
  
//  ScrollController listController;
//  ScrollController listWinnerController;
final ItemScrollController listController = ItemScrollController();
final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();


final ItemScrollController listWinnerController = ItemScrollController();
final ItemPositionsListener itemWinnerPositionsListener = ItemPositionsListener.create();
 

  List<ElemComment> listUserComment = listUserCmntGlb;
  List<ElemComment> listWinners     = <ElemComment>[];
  int _currentItem;
  double curAvaIn ;
  double allAvaIn ;
  double curAvaB  ;
  double allAvaB  ;      
  double allItemW ;
  //double currItemW;
  bool inAdd = false;
  bool isSceollingFinished = false;

  String title = str_titleWinners;
@override
void initState() {
 /* myurl = widget.url;
  if(myurl==null || myurl=='')
   myurl = "https://www.instagram.com/p/CQoqiJPHC3R/";*/
  
  /*listWinnerController = ScrollController();
  listController = ScrollController();
  listController = ScrollController(initialScrollOffset: 50.0);*/
  
  super.initState();
   WidgetsBinding.instance
        .addPostFrameCallback((_) => autoScroll());
  
}

  @override
  void dispose() {
    super.dispose();
  }
  
  /*
  getData(controller) {    
    var html;
    controller.evaluateJavascript( source: "window.document.getElementsByTagName('html')[0].outerHTML;").then((e){
    html = e;
    print("jjj");
    print(html.toString().contains('NXVPg Szr5J  coreSpriteLoggedOutWordmark  '));
    
    for(int i=0; i<10; i++)
    listUserComment.add(ElemComment(index:i, comment: 'Cmnt$i', user: 'User$i'));
    var document = parse(html);
    //    document = parse(html);
    var commnts = document.getElementsByClassName('C4VMK');
    dynamic header = document.getElementsByTagName('header');
    
    dynamic postOwner;
    if(header.length>0)
    postOwner  = "${header[0].nodes[1].nodes[0].innerHtml.split('href=\"/')[1].split('/\"')[0]}";
    String user;
    String cmnt;
    if (commnts.length>0)
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
      listUserComment.add(ElemComment(user:"$user", comment:cmnt, index:k));
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
            
                               if(commnts.length>0)
                               autoScroll();
    });
    //log(html);
    
  }*/
  var index;
  var scrollDuration = Duration(seconds: 2);

   scrollTo({index =-1, last=false}){ 
    var size = MediaQuery.of(context).size;
    double itemWidth = size.width/2; 
     // if(index ==-1)
   /*   {
        if (index == listUserComment.length-1 )
          listController.animateTo( listController.position.maxScrollExtent,//+size.width/5*listUserComment.length, //index*size, 
                                    curve: Curves.easeInCirc, duration: Duration(milliseconds:20));
      }*/
  //    SchedulerBinding.instance.addPostFrameCallback((_) {
     listController.scrollTo(index: index,//(index)*(allItemW-10)-12,
                              curve: Curves.easeInCirc, duration: Duration(milliseconds:20));
                              print("hiiiiiiiii $index");
    //});
  }
 scrollToHalf(index){ 
   //SchedulerBinding.instance.addPostFrameCallback((_)async {
     listController.scrollTo(index:index,//(index)*(allItemW-10)-12,//,(160*1.0)-160,
                                    curve: Curves.easeInOutCubic, duration: Duration(milliseconds:900) );
 //  });
  }

autoScroll()async{ 
  /*for(int i=0; i<listWinners.length;i++)
  {
    listUserComment.add(listWinners[i]);
    listWinners.removeAt(i); 
    setState(() {
      
    });
  }*/

  for(int j=0; j<listWinnerGlb.length; j++)
  {
    String ord;
    switch (j){
    case 0 : 
     ord ='st${j+1}';
     break;
    case 1 : 
       ord = 'nd${j+1}';
       break;
    case 2 : 
       ord = 'rd${j+1}';
       break;
    default : ord = 'th${j+1}';
  } 
    setState(() {
        title = '$ord اختيار الفائز';
    }); 
     
      for(int k = 0; k<2; k++)
      {
              for(int i = 0; i<listUserComment.length; i++)
              {           
                _currentItem=i;
              //  scrollTo();
              await Future.delayed(Duration(milliseconds:i==listUserComment.length-1?2: 90
              )).whenComplete(() {
              scrollTo(index: i);
              });
              }
            /* await  Future.delayed(Duration(milliseconds: 10)).whenComplete(() => 
              scrollTo()
              );*/
      }
            for(int i = 0; i<listUserComment.length; i++)
              {           
              //  scrollTo();
                _currentItem=i;
              await Future.delayed(Duration(milliseconds: 200)).whenComplete(() {
                scrollTo(index: i);
              });
              }
            setState(() {
                _currentItem = listWinnerGlb[j].index;
                      });
            //  await Future.delayed(Duration(seconds:2)).whenComplete((){

              scrollToHalf(listWinnerGlb[j].index,);
              //});
        inAdd = true;
        setState(() {
              
            });
        await Future.delayed(Duration(milliseconds: 1300)).whenComplete(() {
          
        inAdd = false;
        setState(() {
        listWinners.add(listUserComment[listWinnerGlb[j].index]);
      //  listUserComment.removeAt(j);           
            });
      // if(listWinners.length==1)
        SchedulerBinding.instance.addPostFrameCallback((_) {
          listWinnerController.scrollTo(index: j, curve: Curves.easeInOutExpo, duration: Duration(milliseconds:300) );
        });

        });
        
            setState(() {
                _currentItem = -1;
                      });
              
              //_currentItem = -1;
        for(int k =1; k<4; k++)
        await Future.delayed(Duration(milliseconds:1000*k))
        .whenComplete(() => setState((){
             title = '($k) تهانينا';
           })
        );
  }
  
  for(int i = 0; i<listUserCmntGlb.length; i++)
  {
    
    //final existing = Set<ElemComment>();
    listUserComment.removeWhere((element) => element == listWinnerGlb[i]);
   //  listUserComment2 = listUserComment.where((listWinnerGlb[i]) => existing.add(listWinnerGlb[i])).toList();
  }
  
  setState((){ 
    isSceollingFinished = true;
  });
}
  FlatButton button ;
  @override
  Widget build(BuildContext context) {
    var sizeM = MediaQuery.of(context).size;
    curAvaIn  = 23.50* sizeM.width/100;
    allAvaIn  = 17.82* sizeM.width/100;
    curAvaB   = curAvaIn + 3;//23.44* sizeM.width/100;
    allAvaB   = allAvaIn + 3; //18.75* sizeM.width/100;    
    allItemW  = curAvaB*2+10;//allAvaB  + allAvaIn+50;
    //currItemW = allItemW  + 6+30;

    if(listWinners.length>0)
    {
      allAvaIn = 2*allAvaIn/3;
      allAvaB  = 2*allAvaB/3;
      curAvaB  = 2*curAvaB/3;
      curAvaIn = 2*curAvaIn/3;
    }
    double itemMargin = listWinners.length==0? 10:10+allAvaIn/3;

    return Scaffold(
        floatingActionButton: FlatButton(          
          color: Colors.blue,
          child: Icon(Icons.add),
          onPressed: ()  {
          //  for(int i=0;i<10;i++)

            autoScroll();
        },),
        body: SafeArea(
          child:/* Stack(
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
                //                  'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36'
                           //      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"

                            ),
                          ),
                          onWebViewCreated: (InAppWebViewController controller) {
                            webView = controller;
                          },
                          onLoadStart: (InAppWebViewController controller, url) {

                          },
                          onLoadStop: (InAppWebViewController controller, Uri url) async {
                            getData(controller);
                          },
                          onReceivedServerTrustAuthRequest: (InAppWebViewController controller, challenge) async {
                            return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                          },
                        )
                      )
                  ]),
                  ),*/
                  Container(
                    //padding:EdgeInsets.only(top:30),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/backgWinner.png"), fit: BoxFit.cover,)
                    ),
                    child: //ListView.builder(
                                        
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                         children:[
                           Visibility(  visible: isSceollingFinished,
                           child:  Image.asset('assets/images/cam.png'),
                          ),
                          Text(title,
                                  style: TextStyle(fontFamily: fntAdobe, color: Colors.white, fontSize: 17,
                                            shadows: <Shadow>[
                                                                Shadow(
                                                                  offset: Offset(0.5, 0.5),
                                                                  blurRadius: 1.0,
                                                                  color: Colors.black54,
                                                                ),
                                                              ],
                          ),),
                           Visibility(  visible: isSceollingFinished,
                             child:  Image.asset('assets/images/sh.png'),
                           ),
                        ]),
                        Visibility(   visible: isSceollingFinished,child:Row(
                          children:[
                            Container(
                              height:MediaQuery.of(context).size.height*.1277 ,
                              width: MediaQuery.of(context).size.width*.2276,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(im,)
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                ////هنا بدلت زدتهم
                                Text(cname,style: TextStyle(
                                 color: white,
                                 fontSize: 23,
                                 fontWeight: FontWeight.bold,
                                 fontFamily: fntAdobe,

                                ),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xa8f7f7f9),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('عرض المنشور',style: TextStyle(
                                        fontFamily: fntAdobe,
                                        color: white,
                                        fontSize: 11,
                                      ),),
                                      Image.asset('images/arr.png')
                                    ],
                                  ),

                                ),
                              ],
                            )

                          ]


                        ),),
                        Container( 
                          margin:EdgeInsets.only(top:7),
                          height: allItemW+65,
                          child: ScrollablePositionedList.builder(
                            reverse: true, 
                            physics: BouncingScrollPhysics(),
                            itemScrollController: listController,
                            itemPositionsListener: itemPositionsListener,
                            itemCount: listUserComment.length,
                            scrollDirection: Axis.horizontal,  
                          //  physics :Bouncing.ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index ) { 
                            return /*VisibilityDetector(
                              key: Key(index.toString()),
                              onVisibilityChanged: (VisibilityInfo info) {
                                if (info.visibleFraction == 1 && !sceolling)  
                                  setState(() {_currentItem = index;});
                                    print(_currentItem);
                              },
                              child:*/ Container(
                                margin:index==listUserComment.length-1 || index==0 || index == _currentItem?
                                        index==listUserComment.length-1?
                                         EdgeInsets.only(left:sizeM.width/4, right: itemMargin)
                                         :index==0?
                                          EdgeInsets.only(left:itemMargin, right: sizeM.width/4)   
                                         :EdgeInsets.symmetric(horizontal: sizeM.width/4-curAvaB/2) 
                                       :EdgeInsets.symmetric(horizontal: itemMargin, vertical: 0),
                                padding: EdgeInsets.zero,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                       /* radius:_currentItem!=null && _currentItem == index ?  80 :
                                        60,                                          
                                        backgroundColor: Colors.white,                                
                                        child: CircleAvatar(    
                                         radius:_currentItem!=null && _currentItem == index? 77 :
                                         57,  */          
                                         
                                        radius:_currentItem!=null && _currentItem == index ?  curAvaB :
                                        allAvaB,                                          
                                        backgroundColor: Colors.white,                                
                                        child: CircleAvatar(    
                                              radius:_currentItem!=null && _currentItem == index? curAvaIn :
                                              allAvaIn,                   
                                              child:listUserComment[index].img != null?
                                                    CircleAvatar(backgroundImage:  FileImage( listUserComment[index].img),
                                                    radius:200)
                                                   :Image.asset('assets/images/person.png'),//listUserComment[index].user.substring(0,2)),
                                          )                                     
                                       ),
                                      SizedBox(height: 5,),
                                      Container(
                                        width: sizeM.width/2,
                                        height: 70,
                                        child: Column(
                                          children: [
                                            Text(listUserComment[index].user, textAlign: TextAlign.center,
                                                 style:TextStyle(fontFamily: fntEloqia, color: Colors.white, fontSize: 18,), ),
                                            SizedBox(height: 10,),                                           
                                            Flexible(
                                              child: Text(listUserComment[index].comment, textAlign: TextAlign.center,                                              
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style:TextStyle(fontFamily: fntAdobe, color: Colors.white, fontSize: 14,), 
                                              )
                                            )
                                          ],
                                        )
                                      ),
                                    ],
                                ),
                             // ),
                            );
                           },),
                        ),
                        listWinners.length==0?
                        SizedBox(height: 0,)
                        :
                        Expanded(
                          child: ScrollablePositionedList.builder(
                              itemScrollController:  listWinnerController,
                              itemPositionsListener: itemWinnerPositionsListener,

                               // shrinkWrap: true ,
                                itemCount: listWinners.length,   
                                itemBuilder: (BuildContext context, int index ) { 
                                return  ListTile(
                                  title:Text(listWinners[index].comment) ,
                                  leading: Image.asset('assets/images/person.png'),
                                );
                               }
                          ),
                        )
                      ],
                    )//ListView.builder( itemBuilder: (BuildContext context, listUserComment.length){} )

                    
                  )
          //  ],  ),
        ),
    );
  }
}
