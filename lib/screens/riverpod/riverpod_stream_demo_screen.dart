import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:training/provider/riverpod_state_notifier.dart';

class RiverpodStreamDemoScreen extends StatefulWidget {
  RiverpodStreamDemoScreen({Key? key}) : super(key: key);
  static const String url = "RIVERPOD_STREM_DEMO_SCREEN";

  @override
  State<RiverpodStreamDemoScreen> createState() =>
      _RiverpodStreamDemoScreenState();
}

class _RiverpodStreamDemoScreenState extends State<RiverpodStreamDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Stream demo Screen"),
      ),
      body: Consumer(
        builder: (ctx, WidgetRef ref, _) {
          final users = ref.watch(userStreamProvider);
          return users.when(
            data: (data) => Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${data.name}"),
                    Text(data.age.toString()),
                    Text(data.occupation)
                  ],
                ),
              ),
            ),
            error: (error, trace) => Text(
                "Error : ${error.toString()}, Trace : ${trace.toString()}"),
            loading: () => Text("Waiting for stream to initialize"),
          );
        },
      ),
    );
  }
}
