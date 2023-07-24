import 'package:ahmed_training/app/data/auth/register_request_model.dart';
import 'package:ahmed_training/app/data/auth/register_response_model.dart';
import 'package:dio/dio.dart';

class AuthService {

  Future<RegisterResponseModel?> registerCall ({required String name , required String email ,
  required String password , required String avatar})async{

   String myUrl = "https://api.escuelajs.co/api/v1/users/";
   Dio dio = Dio();

   RegisterRequestModel data = RegisterRequestModel(
       password: password,
       name: name,
       email: email,
       avatar: avatar);
   print(data.avatar);
   print(data.email);
   print(data.password);
   print(data.name);

    try {
      var response =  await dio.post(myUrl , data: data.toJson());
      if (response.statusCode == 201){
        print(response.data);
        return RegisterResponseModel.fromJson(response.data);
      }
    }catch (e){
      rethrow ;
    }
    return null;
  }
}