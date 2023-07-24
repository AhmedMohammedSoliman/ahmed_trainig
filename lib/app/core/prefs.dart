import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/auth/register_response_model.dart';
class Prefs {

 static late SharedPreferences prefs ;


 static  Future <bool> saveString ({required String key , required String value})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future <bool> setMap ({required String key , required Map <dynamic , dynamic> object}) async {
    return prefs.setString(key, jsonEncode(object));
  }

  static String? getMap ({required String key}){
    return prefs.getString(key);
  }

 static String? getString ({required String key}) {
   return prefs.getString(key);
 }

 static  Future <bool> saveUser ({required String key , required RegisterResponseModel model})async{
    return setMap(key: key, object: model.toJson());

  }

  static Future <bool> saveToken ({required String key , required String token}) async{
   return saveString(key: key, value: token) ;
  }

  static String? getToken ({required String key}){
    return getString(key: key);
  }

  static String? getUser ({required String key}){
    return getMap(key: key);
  }

}
