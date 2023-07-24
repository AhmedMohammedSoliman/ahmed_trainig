import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef  OnChanged = void Function(String)?;
typedef Validator = String? Function(String?)?;
Widget textFormFieldWidget ({required String hint , required IconData icon , required
OnChanged onChanged , required Validator validator , required Color color ,
bool obscure = false}){

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30),
    child: TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint ,
        hintStyle: TextStyle(
          color: color
        ),
        border: InputBorder.none ,
        fillColor: Colors.grey.shade200 ,
        filled: true ,
        prefixIcon: Icon(icon) ,

      ),
    ),
  );
}