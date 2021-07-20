class User{
String username;
int id;
int isAdmin;
User(this.username,this.id,this.isAdmin);
User.fromJson(Map<String, dynamic> json) {

  this.username= json['name'];
  this.id= json['id'];
  this.isAdmin=json['is_admin'];

}

}