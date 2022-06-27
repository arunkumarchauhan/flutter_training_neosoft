import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/provider/riverpod_provider_observer.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';
import 'package:training/screens/riverpod/clock_with_statenotifier.dart';
import 'package:training/screens/riverpod/future_provider_demo.dart';
import 'package:training/screens/riverpod/riverpod_demo_screen.dart';
import 'package:training/screens/riverpod/riverpod_stream_demo_screen.dart';
import 'package:training/theme_data_constants.dart';

void main() {
  runApp(ProviderScope(observers: [Logger()], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: "Flutter Demo",
      initialRoute: RouterScreen.url,
      routes: {
        RouterScreen.url: (_) => const RouterScreen(),
        RiverpodDemoScreen.url: (_) => const RiverpodDemoScreen(),
        RiverpodDemoSecondScreen.url: (_) => const RiverpodDemoSecondScreen(),
        ClockWithStateNotifierScreen.url: (_) =>
            const ClockWithStateNotifierScreen(),
        FutureProviderDemoScreen.url: (_) => const FutureProviderDemoScreen(),
        RiverpodStreamDemoScreen.url: (_) => RiverpodStreamDemoScreen(),
      },
      debugShowCheckedModeBanner: false,
      // home: const RouterScreen(),
    );
  }
}

class RouterScreen extends StatelessWidget {
  static const url = "/";
  const RouterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Router Screen"),
      ),
      body: ListView(
        children: [
          buildElevatedButton(RiverpodDemoScreen.url, () {
            Navigator.pushNamed(context, RiverpodDemoScreen.url);
          }),
          buildElevatedButton(ClockWithStateNotifierScreen.url, () {
            Navigator.pushNamed(context, ClockWithStateNotifierScreen.url);
          }),
          buildElevatedButton(FutureProviderDemoScreen.url, () {
            Navigator.pushNamed(context, FutureProviderDemoScreen.url);
          }),
          buildElevatedButton(RiverpodStreamDemoScreen.url, () {
            Navigator.pushNamed(context, RiverpodStreamDemoScreen.url);
          }),
        ],
      ),
    );
  }
}
