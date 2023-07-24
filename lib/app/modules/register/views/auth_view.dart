import 'dart:io';

import 'package:ahmed_training/app/core/extensions.dart';
import 'package:ahmed_training/app/core/widgets/buttonWidgetr.dart';
import 'package:ahmed_training/app/core/widgets/mediaQuerys.dart';
import 'package:ahmed_training/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../core/check_network.dart';
import '../../../core/widgets/textFormFieldWidget.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: AuthController(),
        builder: (controller){
          return Scaffold(
            body: Center(
              child: Obx(() {
                if (controller.isRegisterLoading.value) {
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
                            text: "Register",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        SizedBox(
                          height: mediaQueryHight(height: 0.03, context: context),
                        ),
                        InkWell(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200),
                            child: controller.isImageLoading.value ?
                            Center(
                              child: Text("Loading..." , style: TextStyle(
                                  color: Colors.black
                              ),),
                            ) : controller.image != null
                                ? Image.file(
                              File(controller.image!.path),
                              fit: BoxFit.fill,
                            )
                                : const Icon(Icons.image),
                          ),
                        ),
                        SizedBox(
                          height: mediaQueryHight(height: 0.03, context: context),
                        ),
                        textFormFieldWidget(
                            icon: Icons.person,
                            hint: "Enter your name",
                            onChanged: (text) {
                              controller.name.value = text;
                            },
                            color: Colors.black,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please name is required";
                              } else {
                                return null;
                              }
                            }),
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
                        textFormFieldWidget(
                            icon: Icons.password,
                            hint: "Enter your rePassword",
                            onChanged: (text) {
                              controller.rePassword.value = text;
                            },
                            color: Colors.black,
                            obscure: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please rePassword is required";
                              } else if (controller.password !=
                                  controller.rePassword) {
                                return "please password and rePassword not matching";
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
                                controller.register();
                              }else if (await isConnect() == false){
                                Get.snackbar("Connection error",
                                    "You don't connect with the internet" ,
                                    snackPosition: SnackPosition.BOTTOM ,
                                    colorText: Colors.red);
                              }
                            },
                            child: const Text("Register"),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: mediaQueryHight(height: 0.03, context: context),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
