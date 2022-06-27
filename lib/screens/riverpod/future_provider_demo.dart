import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/provider/riverpod_state_notifier.dart';

class FutureProviderDemoScreen extends ConsumerWidget {
  const FutureProviderDemoScreen({Key? key}) : super(key: key);
  static const String url = "FUTURE_PROVIDER_DEMO_SCREEN";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> userPro =
        ref.watch(futureUserProvider(const Tuple3("Sumit", 21, "Developer")));
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureProvider Demo Screen"),
      ),
      body: Center(
        child: userPro.when(
            data: (data) => Column(
                  children: [
                    Text("Name : ${data.name}"),
                    Text("Age : ${data.age}"),
                    Text("Occupation : ${data.occupation}")
                  ],
                ),
            error: (error, trace) => Text(
                "error :${error.toString()} , Trace : ${trace.toString()}"),
            loading: () => const Text("Loading")),
      ),
    );
  }
}
