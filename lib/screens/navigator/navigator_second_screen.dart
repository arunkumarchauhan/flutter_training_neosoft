import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Pop back data unnamed route");
              },
              child: const Text("Pop Unnamed Route"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Pop back data NamedPush ModalRoute");
              },
              child: const Text("Pop back data NamedPush"),
            )
          ],
        ),
      ),
    );
  }
}
