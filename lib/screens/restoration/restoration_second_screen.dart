import 'package:flutter/material.dart';

class RestorationSecondScreen extends StatefulWidget {
  const RestorationSecondScreen({Key? key}) : super(key: key);
  static const String url = "RestorationDemoScreenSecond";
  @override
  State<RestorationSecondScreen> createState() =>
      _RestorationSecondScreenState();
}

class _RestorationSecondScreenState extends State<RestorationSecondScreen>
    with RestorationMixin {
  RestorableTextEditingController _controller =
      RestorableTextEditingController();
  RestorableBool _isChecked = RestorableBool(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restoration Second Screen"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: _controller.value,
          ),
          Checkbox(
              value: _isChecked.value,
              onChanged: (value) {
                _isChecked.value = value ?? false;
                setState(() {});
              })
        ],
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => "restoration_screen_second";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_controller, "text_field2");
    registerForRestoration(_isChecked, "isChecked2");
  }
}
