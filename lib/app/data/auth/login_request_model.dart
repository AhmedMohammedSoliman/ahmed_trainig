class LoginRequestModel {

  String email ;
  String password ;

  LoginRequestModel ({required this.password ,required this.email});

  LoginRequestModel.fromJson(Map <String , dynamic> json) :
        this (
        email: json["email"] as String ,
        password: json["password"] as String ,
      );

  Map <String , dynamic> toJson (){
    return {
      "email" : email ,
      "password" : password ,
    };
  }
}