import 'package:flutter/material.dart';
import 'package:training/screens/restoration/restoration_second_screen.dart';

class RestorationFistScreen extends StatefulWidget {
  const RestorationFistScreen({Key? key}) : super(key: key);
  static const String url = "RestorationDemoScreenFirst";
  @override
  State<RestorationFistScreen> createState() => _RestorationFistScreenState();
}

class _RestorationFistScreenState extends State<RestorationFistScreen>
    with RestorationMixin {
  RestorableTextEditingController _controller =
      RestorableTextEditingController();
  RestorableBool _isChecked = RestorableBool(false);

  static Route<void> _restorableSecondScreenRoute(
      BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
        builder: (context) => RestorationSecondScreen());
  }

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: "myapp",
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Restoration First Screen"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Push Restorable Second Screen"),
            onPressed: () {
              Navigator.restorablePush(context, _restorableSecondScreenRoute);
            },
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => "restoration_screen_first";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_controller, "text_field1");
    registerForRestoration(_isChecked, "isChecked");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _isChecked.dispose();
  }
}
