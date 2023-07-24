import 'package:flutter/cupertino.dart';

Widget textWidget ({required String text , required Color color ,
required FontWeight fontWeight , required double fontSize }){
   return Text(text , style: TextStyle(
     fontWeight: fontWeight , fontSize: fontSize , color: color
   ),);
}