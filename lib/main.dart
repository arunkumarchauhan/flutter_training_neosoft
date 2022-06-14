import 'package:flutter/material.dart';
import 'package:training/screens/selection_screen.dart';
import 'package:training/screens/slivers/sliver_screen.dart';
import './screens/build_your_own_widget//category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": ((context) => const SelectionScreen()),
        Category.url: (context) => const Category(),
        SelectionScreen.url: (context) => const SelectionScreen(),
        SliverScreen.url: (context) => const SliverScreen(),
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
