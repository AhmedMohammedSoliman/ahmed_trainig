import 'package:ahmed_training/app/core/prefs.dart';
import 'package:ahmed_training/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class LoginController extends GetxController{

  RxBool isLoginLoading = false.obs ;
  var formKey = GlobalKey<FormState>();
  RxString email = "".obs ;
  RxString password = "".obs ;
  AuthService service = AuthService();

  @override
  void onInit() {
    // TODO: implement onInit
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void login ()async{
    isLoginLoading.value = true ;
    var response = await service.loginCall(
        email: email.value, password: password.value);
    if (response!.message == null) {
      Get.snackbar("Login Successfully", "Welcome to home",
          snackPosition: SnackPosition.TOP , colorText: Colors.green);
      Prefs.saveToken(key: "token", token: response.accessToken!);
      Get.to(const HomeView());
      print("saved token");
      isLoginLoading.value = false;
    } else if (response.message != null){
      Get.snackbar("Register Failed", "Welcome ${response.message}",
          snackPosition: SnackPosition.TOP , colorText: Colors.red);
      isLoginLoading.value = false;
    }
  }
}