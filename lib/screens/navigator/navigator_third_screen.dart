import 'package:flutter/material.dart';
import 'package:training/screens/navigator/navigator_fourth_screen.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class NavigatorThirdScreen extends StatelessWidget {
  const NavigatorThirdScreen({Key? key}) : super(key: key);
  static const String url = "NAVIGATOR_THIRD_SCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator Third Screen"),
      ),
      body: Center(
        child: Column(

          children: [

            buildElevatedButton("Pop Extract Data with onGenerate ROute", () {
              Navigator.pop(context, "onGenerateRoute Pop data");
            }),
            buildElevatedButton("Push NavigatorFourthScreen", () {
          Navigator.pushNamed(context, NavigatorFourthScreen.url);
            }),

          ],
        ),
      ),
    );
  }
}
