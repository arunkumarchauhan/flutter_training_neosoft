import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/provider/custom_counter_provider.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';
import 'package:training/screens/proxyprovider_demo/provider_assignment_second_screen.dart';

class ProviderAssignmentFirstScreen extends StatelessWidget {
  const ProviderAssignmentFirstScreen({Key? key}) : super(key: key);
  static const String url = "PROVIDER_ASSIGNMENT_FIRST_SCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Assignment First Screen"),
      ),
      body: Column(children: [
        Consumer<CustomCounterProvider>(
          builder: (BuildContext context, CustomCounterProvider counterP, _) {
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("Count : ${counterP.count}"),
            );
          },
        ),
        const SizedBox(
          height: 200,
        ),
        buildElevatedButton("Push to Counter Increment Screen", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProviderIncrementButtonScreen()));
        }),
      ]),
    );
  }
}
