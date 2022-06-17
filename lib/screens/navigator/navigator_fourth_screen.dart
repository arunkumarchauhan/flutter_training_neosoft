import 'package:flutter/material.dart';
import 'package:training/screens/navigator/navigator_fifth_screen.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class NavigatorFourthScreen extends StatelessWidget {
  static const String url="NAVIGATOR_FOURTH_SCREEN";
  const NavigatorFourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator fourth Screen",style: TextStyle(fontSize: 30),),),
      body: Container(

        child: buildElevatedButton("Push Navigator 5th Screen", (){
          Navigator.pushNamed(context, NavigatorFifthScreen.url);
        }),
      ),
    );
  }
}
