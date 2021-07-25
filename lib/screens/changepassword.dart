import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import '../Resources/Strings.dart';
import '../Resources/resourses.dart';
import '../controller/usercontroller.dart';
import '../widgets/add.dart';
class changepass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return changepasswordstate();
  }
}
class changepasswordstate extends State<changepass>{
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  b(){
    Navigator.of(context).pushNamedAndRemoveUntil('/options',(Route<dynamic>route)=>false);
  }
  userController us=userController();
  changepass()async{
    if(t1.text.trim().isNotEmpty&&t2.text.trim().isNotEmpty){
      if(t1.text.trim()==t2.text.trim()){
        us.chanceAdminpas(t1.text.trim(), t2.text.trim()).whenComplete((){
          showdial(context,' تمت العملية بنجاح');

        });
      }

    }else{
      showdial(context,'تاكد من اتصالك بالانترنت');
    }

  }
  @override
  Widget build(BuildContext context) {
    double tw=MediaQuery.of(context).size.width*.73;
    double m1=MediaQuery.of(context).size.height*.03;
    double m2=MediaQuery.of(context).size.height*.03;
    double m3=MediaQuery.of(context).size.height*.07;
    double m4=MediaQuery.of(context).size.height*.03;
    double m5=MediaQuery.of(context).size.height*.10;
  return Scaffold(
    resizeToAvoidBottomInset: false,
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
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              back(context,m1,b),
              title(context,str_changepassword,m2),
              text(context,str_newpass,tw,m3),
              Textfield(context,t1),
              text(context,str_confirmpassword,tw,m3),
              Textfield(context,t2),
              Container(
                margin: EdgeInsets.only(top: m4),
                child: RaisedButton(
                    color: yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(radius1),
                      side:BorderSide(color: white, width: 1),
                    ),
                    onPressed: (){},
                    child:Text(str_save,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: fntAdobe,
                        color: white,
                      ),)),
              ),
            Container(
              margin:EdgeInsets.only(top: m5),
              child: Image.asset('assets/images/admin.png'),
            )

            ],
          ),
        ),
      ),
    ),

  );

  }
}