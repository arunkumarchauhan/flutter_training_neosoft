import 'package:flutter/material.dart';
import 'package:training/screens/build_custom_layout/flutter_layout_demo_screen.dart';
import 'package:training/screens/navigator/navigate_first_screen.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';
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
        LayoutDemoScreen.url: (context) => LayoutDemoScreen(),
        NavigatorFirstScreen.url: (context) => const NavigatorFirstScreen(),
        NavigatorSecondScreen.url: (context) => const NavigatorSecondScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == NavigatorThirdScreen.url) {
          final args = settings.arguments;
          print(args);
          return MaterialPageRoute(
              builder: (context) => const NavigatorThirdScreen());
        }

        var uri = Uri.parse(settings.name??"");
        if(uri.pathSegments.length==2&&uri.pathSegments.first==NavigatorThirdScreen.url){

          var id=uri.pathSegments[1];
          print("Extracted id from url : $id");
          return MaterialPageRoute(builder: (context)=>const NavigatorThirdScreen());
        }


      },
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.greenAccent,
          primarySwatch: Colors.green,
          primaryColor: Colors.blue),

      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const SelectionScreen(),
    );
  }
}
