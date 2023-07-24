import 'package:ahmed_training/app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
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
  bool isRegisterLoading = false ;
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
      image = imagePick ;
      avatar.value = image!.path ;
    }
    update();
  }

  void register ()async{
    isRegisterLoading = true ;
    await service.registerCall(
        name: name.value,
        email: email.value,
        password: password.value,
        avatar: avatar.value);
    isRegisterLoading = false ;
    update();
  }

}
