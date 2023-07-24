import 'package:ahmed_training/app/core/prefs.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.prefs = await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Prefs.getToken(key: "token") != null ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
