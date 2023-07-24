import 'dart:io';

import 'package:ahmed_training/app/core/prefs.dart';
import 'package:ahmed_training/app/modules/home/views/home_view.dart';
import 'package:ahmed_training/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {

  RxString email = "".obs ;
  RxString name = "".obs ;
  RxString password = "".obs ;
  RxString rePassword = "".obs ;
  RxString avatar = "".obs ;
  XFile? image ;
  final ImagePicker picker = ImagePicker();
  RxBool isRegisterLoading = false.obs ;
  RxBool isImageLoading = false.obs ;
  AuthService service = AuthService();
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pickImage ()async{
    var imagePick = await picker.pickImage(source: ImageSource.gallery);
    if (imagePick != null){
      isImageLoading.value = true ;
      image = imagePick ;
      File file = File(image!.path);
      var avatarImage = await service.uploadImage(file);
      avatar.value = avatarImage;
      isImageLoading.value = false ;
      print(avatar.value);
    }
    update();
  }

  void register ()async {
    isRegisterLoading.value = true;
    var response = await service.registerCall(
        name: name.value,
        email: email.value,
        password: password.value,
        avatar: avatar.value);
    if (response!.error == null) {
      Get.snackbar("Register Successfully", "Welcome ${response.role}",
          snackPosition: SnackPosition.TOP , colorText: Colors.green);
      Prefs.saveUser(key: "userData" , model: response);
      Get.to(const HomeView());
      print("saved user");
      isRegisterLoading.value = false;
    } else if (response.message != null){
      isRegisterLoading.value = false;
      Get.snackbar("Register Failed", "Welcome ${response.message}",
          snackPosition: SnackPosition.TOP , colorText: Colors.red);
    }
  }}
