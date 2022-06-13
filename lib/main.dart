import 'package:flutter/material.dart';
import 'package:training/screens/selection_screen.dart';
import './screens/build_your_own_widget//category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": ((context) => const SelectionScreen()),
        Category.url: (context) => const Category(),
        SelectionScreen.url: (context) => const SelectionScreen()
      },
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.greenAccent,
          primarySwatch: Colors.cyan,
          primaryColor: Colors.amberAccent),

      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const SelectionScreen(),
    );
  }
}
