import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/provider/riverpod_state_notifier.dart';

class ClockWithStateNotifierScreen extends ConsumerStatefulWidget {
  const ClockWithStateNotifierScreen({Key? key}) : super(key: key);
  static const String url = "CLOCK_WITH_STATE_NOTIFIER_SCREEN";

  @override
  _ClockWithStateNotifierScreenState createState() =>
      _ClockWithStateNotifierScreenState();
}

final clockProvider =
    StateNotifierProvider.autoDispose<Clock, DateTime>((ref) => Clock());

class _ClockWithStateNotifierScreenState
    extends ConsumerState<ClockWithStateNotifierScreen> {
  @override
  void dispose() {
    print("Screen Dispose");
    // ref.read(clockProvider.notifier).dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(provider)
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock with StateNotifier Screen"),
      ),
      body: Column(
        children: [
          Consumer(builder: (_, WidgetRef ref, __) {
            final time = ref.watch(clockProvider);
            return Text(" Current Date Time : $time");
            return Text("$time");
          })
        ],
      ),
    );
  }
}
