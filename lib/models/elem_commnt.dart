
import 'dart:io';

class ElemComment{
  String user;
  String comment;
  int index;
  bool isWinner;
  File img;
  bool isWiner;
 // String eventName;
  ElemComment({this.user, this.comment, this.index,this.img,this.isWiner})
  {
    this.isWinner = this.index % 2 == 0;
  }
  
  factory ElemComment.fromJson(Map<String, dynamic> map) => ElemComment(
     user : map["user"],
     comment : map["comment"],
     index   : map["index"],
    isWiner: map["isWiner"],
    img: map["img"],


  );

  Map<String, dynamic> toJson()=>
  {
     "user"    : user,
     "comment" : comment,
     "index"   : index,
  };

  @override
  toString(){
    print("ElemCommnt $index: $user $comment");
    return "ElemCommnt $index: $user $comment";
  }

  @override
  bool operator ==(Object other)
  {
    if(other is !ElemComment )
    return false;
    return user ==  (other as ElemComment).user;
  }
  
  int _hashCode;
  @override
  // TODO: implement hashCode
  int get hashCode{
    if(_hashCode == null) {
      _hashCode = user.hashCode;
    }
    return _hashCode; 
  }

}