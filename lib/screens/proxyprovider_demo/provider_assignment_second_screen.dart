import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/provider/custom_counter_provider.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';
import 'package:training/services/string_stream_provider.dart';

class ProviderIncrementButtonScreen extends StatelessWidget {
  const ProviderIncrementButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Increment Screen"),
      ),
      body: Column(
        children: [
          buildElevatedButton("Increment Count", () {
            Provider.of<CustomCounterProvider>(context, listen: false)
                .incrementCounter();
          }),
          Consumer<int>(builder: (ctx, int val, _) {
            return Text("Stream Count $val");
          }),
          buildElevatedButton("Increment integer Stream", () {
            Provider.of<CounterStreamGenerator>(context, listen: false)
                .incrementStreamCount();
          }),
        ],
      ),
    );
  }
}
