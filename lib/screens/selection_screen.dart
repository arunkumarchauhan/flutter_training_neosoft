import 'package:flutter/material.dart';
import 'package:training/screens/build_your_own_widget/category.dart';

class SelectionScreen extends StatelessWidget {
  static const String url = "SELECTION_SCREEN";
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Selection Screen")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Category.url);
                },
                child: Material(
                  child: InkWell(
                    splashColor: Colors.blueAccent,
                    child: Container(
                        color: const Color.fromARGB(255, 134, 244, 137),
                        width: double.infinity,
                        height: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          "Category Screen",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
