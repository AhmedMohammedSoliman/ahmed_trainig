import 'dart:io';
import 'package:ahmed_training/app/core/extensions.dart';
import 'package:ahmed_training/app/modules/login/controller/login_controller.dart';
import 'package:ahmed_training/app/modules/register/views/auth_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../core/check_network.dart';
import '../../../core/widgets/buttonWidgetr.dart';
import '../../../core/widgets/mediaQuerys.dart';
import '../../../core/widgets/textFormFieldWidget.dart';
import '../../../core/widgets/text_widget.dart';

class LoginView extends GetView <LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       body: Center(
         child: Obx(() {
           if (controller.isLoginLoading.value) {
             return const SizedBox(
               width: 50,
               height: 20,
               child: LoadingIndicator(
                   indicatorType: Indicator.ballPulse,

                   /// Required, The loading type of the widget
                   colors: [Colors.black],

                   /// Optional, The color collections
                   strokeWidth: 0.5,

                   /// Optional, The stroke of the line, only applicable to widget which contains line
                   backgroundColor: Colors.white,

                   /// Optional, Background of the widget
                   pathBackgroundColor: Colors.black

                 /// Optional, the stroke backgroundColor
               ),
             );
           }
           return Form(
             key: controller.formKey,
             child: SingleChildScrollView(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   SizedBox(
                     height: mediaQueryHight(height: 0.02, context: context),
                   ),
                   textWidget(
                       text: "Login",
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 20),
                   SizedBox(
                     height: mediaQueryHight(height: 0.03, context: context),
                   ),
                   textFormFieldWidget(
                       icon: Icons.email,
                       hint: "Enter your email",
                       onChanged: (text) {
                         controller.email.value = text;
                       },
                       color: Colors.black,
                       validator: (text) {
                         if (text == null || text.trim().isEmpty) {
                           return "Please email is required";
                         } else if (!text.isValidEmail()) {
                           return "Please enter a valid email";
                         }else {
                           return null ;
                         }
                       }),
                   SizedBox(
                     height: mediaQueryHight(height: 0.03, context: context),
                   ),
                   textFormFieldWidget(
                       icon: Icons.password,
                       hint: "Enter your password",
                       onChanged: (text) {
                         controller.password.value = text;
                       },
                       color: Colors.black,
                       obscure: true,
                       validator: (text) {
                         if (text == null || text.trim().isEmpty) {
                           return "Please password is required";
                         } else if (controller.password.value.length < 4) {
                           return "Please password must more than 4 letters";
                         } else {
                           return null;
                         }
                       }),
                   SizedBox(
                     height: mediaQueryHight(height: 0.03, context: context),
                   ),
                   buttonWidget(
                       background: Colors.indigo,
                       textColor: Colors.white,
                       onPressed: () async{
                         if (controller.formKey.currentState!.validate() && await  isConnect()){
                           controller.login();
                         }else if (await isConnect() == false){
                           Get.snackbar("Connection error",
                               "You don't connect with the internet" ,
                               snackPosition: SnackPosition.BOTTOM ,
                               colorText: Colors.red);
                         }
                       },
                       child: const Text("Login"),
                       fontSize: 18,
                       fontWeight: FontWeight.bold),
                   SizedBox(
                     height: mediaQueryHight(height: 0.03, context: context),
                   ),
                   InkWell(
                     onTap: (){
                       Get.to(const AuthView());
                     },
                     child: textWidget(
                         text: "Or create account",
                         color: Colors.indigo,
                         fontWeight: FontWeight.bold,
                         fontSize: 20),
                   ),
                 ],
               ),
             ),
           );
         }),
       ),
     ),
   );
  }
}