import 'dart:io';
import 'package:ahmed_training/app/core/check_network.dart';
import 'package:ahmed_training/app/data/auth/login_request_model.dart';
import 'package:ahmed_training/app/data/auth/login_response_model.dart';
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
       if (await isConnect()){
         try {
           var response =  await dio.post(myUrl , data: data.toJson());
           if (response.statusCode == 201){
             print(response.data);
             return RegisterResponseModel.fromJson(response.data);
           }else {
             print(response.statusMessage);
           }
         }catch (e){
           rethrow ;
         }
       }
       return null;
      }

  Future<String> uploadImage(File file) async {
    Dio dio = Dio();

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    var response = await dio.post(
        "https://api.escuelajs.co/api/v1/files/upload", data: formData);
    return response.data['location'];
  }
   
  Future <LoginResponseModel?> loginCall ({
    required String email , required String password})async{
    
    Dio dio = Dio() ;
    String myUrl = "https://api.escuelajs.co/api/v1/auth/login" ;

    LoginRequestModel data = LoginRequestModel(
        password: password, email: email);

    if (await isConnect ()){
      try {
        var response = await dio.post(
            myUrl, data: data.toJson());

        if (response.statusCode == 201){
          return LoginResponseModel.fromJson(response.data);
        }else {
          print(response.statusMessage);
        }
      }catch (e){
        rethrow ;
      }
    }
    return null ;
  }
}