class RegisterRequestModel {

  String name ;
  String email ;
  String password ;
  String avatar ;

  RegisterRequestModel ({required this.password , required this.name ,
  required this.email , required this.avatar});

  RegisterRequestModel.fromJson(Map <String , dynamic> json) :
      this (
        name: json["name"] as String ,
        email: json["email"] as String ,
        password: json["password"] as String ,
        avatar: json["avatar"] as String ,
      );

  Map <String , dynamic> toJson (){
    return {
      "name" : name ,
      "email" : email ,
      "password" : password ,
      "avatar" : avatar
  };
}
}