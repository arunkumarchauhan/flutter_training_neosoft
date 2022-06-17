import 'package:flutter/material.dart';
ThemeData lightTheme=ThemeData(
  brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.greenAccent,
    primarySwatch: Colors.green,
    primaryColor: Colors.blue,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(shadowColor:MaterialStateProperty.all<Color>(Colors.blue) )
  )
);


ThemeData darkTheme=ThemeData(brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.greenAccent,
    primarySwatch: Colors.green,
    primaryColor: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(shadowColor:MaterialStateProperty.all<Color>(Colors.blue) )
    ),
  textTheme: TextTheme()
);
