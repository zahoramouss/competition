import 'package:flutter/scheduler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';
import 'package:html_app/model/elem_commnt.dart';
import 'package:html_app/ressources/ressources.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyApp extends StatefulWidget {
  final url;

  const MyApp({Key key, this.url}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController webView;
  String myurl;
  
//  ScrollController listController;
//  ScrollController listWinnerController;
final ItemScrollController listController = ItemScrollController();
final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();


final ItemScrollController listWinnerController = ItemScrollController();
final ItemPositionsListener itemWinnerPositionsListener = ItemPositionsListener.create();
 
@override
void initState() {
  myurl = widget.url;
  if(myurl==null || myurl=='')
   myurl = "https://www.instagram.com/p/CQoqiJPHC3R/";
  
  /*listWinnerController = ScrollController();
  listController = ScrollController();
  listController = ScrollController(initialScrollOffset: 50.0);*/
  super.initState();
}

  @override
  void dispose() {
    super.dispose();
  }

  List<ElemComment> listUserComment = <ElemComment>[];
  List<ElemComment> listWinners     = <ElemComment>[];
  int _currentItem;
  double curAvaIn ;
  double allAvaIn ;
  double curAvaB  ;
  double allAvaB  ;      
  double allItemW ;
  //double currItemW;
  bool inAdd = false;
  bool sceolling = false;

  getData(controller) async{    
    var html;
    controller.evaluateJavascript( source: "window.document.getElementsByTagName('html')[0].outerHTML;").then((e){
    html = e;
    print("jjj");
    print(html.toString().contains('NXVPg Szr5J  coreSpriteLoggedOutWordmark  '));
    var document = parse(html);
    //    document = parse(html);
    var commnts = document.getElementsByClassName('C4VMK');
    dynamic header = document.getElementsByTagName('header');
    
    dynamic postOwner = "${header[0].nodes[1].nodes[0].innerHtml.split('href=\"/')[1].split('/\"')[0]}";
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
    });
    //log(html);
  }
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
      SchedulerBinding.instance.addPostFrameCallback((_) {
     listController.scrollTo(index: index,//(index)*(allItemW-10)-12,
                              curve: Curves.easeInCirc, duration: Duration(milliseconds:20));
                              print("hiiiiiiiii $index");});
  }
 scrollToHalf(index)async{ 
   SchedulerBinding.instance.addPostFrameCallback((_) {
    listController.scrollTo(index:index,//(index)*(allItemW-10)-12,//,(160*1.0)-160,
                                    curve: Curves.easeInCirc, duration: Duration(milliseconds:300) );
   });
    inAdd = true;
    listWinners.add(listUserComment[index]);
    listUserComment.removeAt(index);  
    if(listWinners.length==1)
    SchedulerBinding.instance.addPostFrameCallback((_) {
       listWinnerController.scrollTo(index: 1, curve: Curves.easeIn, duration: Duration(milliseconds:300) );
    });
  }

autoScroll()async{ 
  sceolling = true;
  for(int k = 0; k<10; k++)
  {
          for(int i = 0; i<listUserComment.length; i++)
          {           
            _currentItem=i;
          //  scrollTo();
           await Future.delayed(Duration(milliseconds: 90
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
           await Future.delayed(Duration(milliseconds:200)).whenComplete(() {
             scrollTo(index: i);
           });
          }
          _currentItem = 2;
          scrollToHalf(2,);
          sceolling = false;
          
          //_currentItem = -1;
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
        body: Stack(
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
                  //padding:EdgeInsets.only(top:30),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/backgWinner.png"), fit: BoxFit.cover,)
                  ),
                  child: //ListView.builder(
                                      
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(titleWinners,
                                style: TextStyle(fontFamily: fntAdobe, color: Colors.white, fontSize: 17,
                                          shadows: <Shadow>[
                                                              Shadow(
                                                                offset: Offset(0.5, 0.5),
                                                                blurRadius: 1.0,
                                                                color: Colors.black54,
                                                              ),
                                                            ],
                        ),),
                      ),
                      Container( 
                        margin:EdgeInsets.only(top:10),
                        height: allItemW+65,
                        child: ScrollablePositionedList.builder(
                          reverse: true,
                          itemScrollController: listController,
                          itemPositionsListener: itemPositionsListener,
                          itemCount: listUserComment.length,
                          scrollDirection: Axis.horizontal,   
                          itemBuilder: (BuildContext context, int index ) { 
                          return VisibilityDetector(
                            key: Key(index.toString()),
                            onVisibilityChanged: (VisibilityInfo info) {
                              if (info.visibleFraction == 1 && !sceolling)  
                                setState(() {_currentItem = index;});
                                  print(_currentItem);
                            },
                            child: Container(
                              margin:index==listUserComment.length-1 || index==0?
                                      index==listUserComment.length-1?
                                       EdgeInsets.only(left:sizeM.width/4, right: 2)
                                      :EdgeInsets.only(left:2, right: sizeM.width/4)   
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
                                        child: Text("$index"),//listUserComment[index].user.substring(0,2)),
                                      ),
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
                            ),
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
          ],
        ),
    );
  }
}