import 'package:flutter/material.dart';
import 'package:training/screens/navigator/navigator_fourth_screen.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class NavigatorFifthScreen extends StatelessWidget {
  static const String url="NAVIGATOR_FIFTH_SCREEN";

  const NavigatorFifthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator 5th Screen", style: TextStyle(fontSize: 30),),),
      body: Column(children: [

        buildElevatedButton("Pop until   NavigatorSecondScreen(NamedPush)", () {
          Navigator.popUntil(context, ModalRoute.withName(NavigatorSecondScreen.url));

        }),
        buildElevatedButton("Pop until NavigatorSecondScreen (Unnamed Push)", () {

        Navigator.popUntil(context, ModalRoute.withName( NavigatorSecondScreen.url));

        }),
      ],),
    );
  }
}