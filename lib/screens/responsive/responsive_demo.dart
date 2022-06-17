import 'package:flutter/material.dart';
import 'package:training/screens/responsive/stack_demo.dart';
import 'package:training/screens/responsive/wrap_demo.dart';
import 'package:training/screens/selection_screen.dart';

class ResponsiveDemo extends StatelessWidget {
  const ResponsiveDemo({Key? key}) : super(key: key);
static const String url="RESPONSIVE_DEMO";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wrap Demo"),),
      body: Center(
        child: Column(children: [
          ScreenSelectionButton(url: WrapDemo.url),
          ScreenSelectionButton(url: StackDemo.url)
        ],),
      ),
    );
  }
}
