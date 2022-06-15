import 'package:flutter/material.dart';

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
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "onGenerateRoute Pop data");
                },
                child: const Text("Pop Extract Data with onGenerate ROute"))
          ],
        ),
      ),
    );
  }
}
