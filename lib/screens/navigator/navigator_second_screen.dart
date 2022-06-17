import 'package:flutter/material.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class NavigatorSecondScreen extends StatelessWidget {
  const NavigatorSecondScreen({Key? key}) : super(key: key);
  static const String url = "NAVIGATOR_SECOND_SCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [

        buildElevatedButton("Pop Unnamed Route", () {
          Navigator.pop(context, "Pop back data unnamed route");
        }),

          buildElevatedButton("Pop back data NamedPush", () {
            Navigator.pop(context, "Pop back data NamedPush ModalRoute");
          }),
            buildElevatedButton("Push NavigatorThirdScreen", (){
              Navigator.pushNamed(context, NavigatorThirdScreen.url);
            })
          ],
        ),
      ),
    );
  }
}
