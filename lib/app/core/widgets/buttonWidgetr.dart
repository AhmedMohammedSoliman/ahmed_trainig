import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buttonWidget ({required Color background ,
required Color textColor , required void Function()? onPressed
  ,required Widget child , required double fontSize , required FontWeight fontWeight}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: background ,
    shape: const StadiumBorder(),
    textStyle: TextStyle(
      color: textColor , fontSize: fontSize ,
      fontWeight: fontWeight
    )),
      onPressed: onPressed,
      child: child);
}