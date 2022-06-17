import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/provider/theme_manager_provider.dart';
import 'package:training/screens/build_custom_layout/flutter_layout_demo_screen.dart';
import 'package:training/screens/lifecycle/deactivate_demo.dart';
import 'package:training/screens/lifecycle/lifecycle.dart';
import 'package:training/screens/navigator/navigate_first_screen.dart';
import 'package:training/screens/navigator/navigator_fifth_screen.dart';
import 'package:training/screens/navigator/navigator_fourth_screen.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';
import 'package:training/screens/selection_screen.dart';
import 'package:training/screens/slivers/sliver_screen.dart';
import 'package:training/theme_data_constants.dart';
import './screens/build_your_own_widget//category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ThemeManager(),
      child: Builder(
        builder: (context) {
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
              NavigatorFourthScreen.url:(context)=>const NavigatorFourthScreen(),
              NavigatorFifthScreen.url:(context)=>const NavigatorFifthScreen(),
              LifecycleApp.url:(context)=>const LifecycleApp(),
              DeactivateDemoScreen.url:(context)=>const DeactivateDemoScreen(),
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
           theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: Provider.of<ThemeManager>(context).themeMode,



            //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
            // home: const SelectionScreen(),
          );
        }
      ),
    );
  }
}
