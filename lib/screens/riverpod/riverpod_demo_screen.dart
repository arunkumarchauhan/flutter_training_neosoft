import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

final counterProvider = StateProvider((ref) => 0);

class RiverpodDemoScreen extends ConsumerStatefulWidget {
  const RiverpodDemoScreen({Key? key}) : super(key: key);
  static const String url = "RIVERPOD_DEMO_SCREEN";
  @override
  _RiverpodDemoScreenState createState() => _RiverpodDemoScreenState();
}

class _RiverpodDemoScreenState extends ConsumerState<RiverpodDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Demo Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: Consumer(builder: (_, WidgetRef ref, __) {
              final value = ref.read(counterProvider);
              return Text(value.toString());
            }),
          ),
          buildElevatedButton("Increment Counter", () {
            print("called");
            ref.read(counterProvider.state).state++;
          })
        ],
      ),
    );
  }
}
