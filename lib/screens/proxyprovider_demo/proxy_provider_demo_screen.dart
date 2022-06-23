import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/provider/greeting_provider.dart';
import 'package:training/provider/name_provider.dart';
import 'package:training/provider/custom_counter_provider.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class ProxyProviderDemoScreen extends StatefulWidget {
  const ProxyProviderDemoScreen({Key? key}) : super(key: key);
  static const String url = "PROXY_PROVIDER_DEMO_SCREEN";
  @override
  State<ProxyProviderDemoScreen> createState() =>
      _ProxyProviderDemoScreenState();
}

class _ProxyProviderDemoScreenState extends State<ProxyProviderDemoScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CustomCounterProvider>(
              create: (_) => CustomCounterProvider()),
          ChangeNotifierProxyProvider<CustomCounterProvider, NameProvider>(
            create: (_) => NameProvider(),
            update: (BuildContext context,
                CustomCounterProvider counterProvider,
                NameProvider? nameProvider) {
              nameProvider!.updateCounterProvider(counterProvider);
              return nameProvider;
            },
          ),
          ChangeNotifierProxyProvider2<CustomCounterProvider, NameProvider,
                  GreetingProvider>(
              create: (_) => GreetingProvider(),
              update: (_,
                  CustomCounterProvider counterProvider,
                  NameProvider nameProvider,
                  GreetingProvider? greetingProvider) {
                nameProvider.updateCounterProvider(counterProvider);
                greetingProvider?.setCounterProvider(counterProvider);
                greetingProvider?.setNameProvider(nameProvider);
                return greetingProvider!;
              })
        ],
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("ProxyProvider Demo Screen"),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: 100,
                  child: TextField(
                    controller: _textEditingController,
                    onChanged: (String value) {
                      Provider.of<NameProvider>(context, listen: false)
                          .setName(value);
                    },
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                ),
                buildElevatedButton("Increment Count", () {
                  Provider.of<CustomCounterProvider>(context, listen: false)
                      .incrementCounter();
                }),
                Consumer<GreetingProvider>(builder:
                    (BuildContext context, GreetingProvider greetP, _) {
                  return Text("${greetP.greeting}");
                })
              ],
            ),
          );
        }));
  }
}
