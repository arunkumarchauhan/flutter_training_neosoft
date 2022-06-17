import 'package:flutter/material.dart';
Widget buildElevatedButton( String text,Function onTap){
  return  Container(
    width: double.infinity,
    child: ElevatedButton(

      onPressed: ()=>onTap(),
      child:  Text(text),
    ),
  );
}