import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/provider/riverpod_state_notifier.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class RiverpodDemoScreen extends ConsumerStatefulWidget {
  const RiverpodDemoScreen({Key? key}) : super(key: key);
  static const String url = "RIVERPOD_DEMO_SCREEN";
  @override
  _RiverpodDemoScreenState createState() => _RiverpodDemoScreenState();
}

class _RiverpodDemoScreenState extends ConsumerState<RiverpodDemoScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(counterProvider, (int? previous, int next) {
      if (next > 10) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Counter value :$next Incremented over 10")));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Demo Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Consumer(builder: (_, WidgetRef ref, __) {
              final value = ref.watch(counterProvider);
              return Text(
                value.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ),
          buildElevatedButton("Increment Counter", () {
            ref.read(counterProvider.state).state++;
          }),
          buildElevatedButton("Push Second Screen ", () {
            Navigator.pushNamed(context, RiverpodDemoSecondScreen.url);
          })
        ],
      ),
    );
  }
}

class RiverpodDemoSecondScreen extends StatelessWidget {
  const RiverpodDemoSecondScreen({Key? key}) : super(key: key);
  static const String url = "RIVERPOD_DEMO_SECOND_SCREEN";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment Counter From Second Screen"),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, _) {
            return buildElevatedButton("Increment Counter", () {
              ref.read(counterProvider.state).state++;
            });
          })
        ],
      ),
    );
  }
}
