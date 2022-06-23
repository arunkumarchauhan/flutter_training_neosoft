import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/provider/custom_counter_provider.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';
import 'package:training/services/string_stream_provider.dart';

class ProviderIncrementButtonScreen extends StatefulWidget {
  const ProviderIncrementButtonScreen({Key? key}) : super(key: key);

  @override
  State<ProviderIncrementButtonScreen> createState() =>
      _ProviderIncrementButtonScreenState();
}

class _ProviderIncrementButtonScreenState
    extends State<ProviderIncrementButtonScreen> {
  late CounterStreamGenerator counterStreamModel;
  void initState() {
    super.initState();
    counterStreamModel =
        Provider.of<CounterStreamGenerator>(context, listen: false);
  }

  @override
  void dispose() {
    // counterStreamModel.disposeCountStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>.value(
        initialData: 0,
        value: counterStreamModel.counterStream,
        catchError: (_, error) {
          print(error);
          return -1;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("COunter Increment Screen"),
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
        ));
  }
}
