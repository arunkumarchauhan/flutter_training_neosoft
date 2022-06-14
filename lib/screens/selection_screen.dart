import 'package:flutter/material.dart';
import 'package:training/screens/build_your_own_widget/category.dart';
import 'package:training/screens/slivers/sliver_screen.dart';

class SelectionScreen extends StatelessWidget {
  static const String url = "SELECTION_SCREEN";
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Selection Screen")),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ScreenSelectionButton(
                url: Category.url,
              ),
              ScreenSelectionButton(
                url: SliverScreen.url,
              )
            ],
          ),
        ));
  }
}

class ScreenSelectionButton extends StatelessWidget {
  const ScreenSelectionButton({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, url);
      },
      child: Material(
        child: InkWell(
          splashColor: Colors.blueAccent,
          child: Container(
            decoration: BoxDecoration( color: const Color.fromARGB(255, 134, 244, 137),
            border: Border.all(color: Colors.amberAccent,width: 5)
            ),
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              child: Text(
                url,
                style: const TextStyle(fontSize: 18),
              )),
        ),
      ),
    );
  }
}
