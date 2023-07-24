import 'package:flutter/material.dart';

double mediaQueryHight ({required double height , required BuildContext context}) {

  return MediaQuery.of(context).size.height*height;
}

double mediaQueryWidth ({required double width , required BuildContext context}) {

  return MediaQuery.of(context).size.height*width;
}