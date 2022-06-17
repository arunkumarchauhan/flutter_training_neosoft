import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/screens/lifecycle/deactivate_demo.dart';
import 'package:training/screens/lifecycle/provider/counter_provider.dart';

class LifecycleApp extends StatelessWidget {
  static const String url="LIFECYCLE_APP";
  const LifecycleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (BuildContext context)=>CounterProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LifecycleHomePage(title: ' Lifecycle Demo'),
      ),
    );
  }
}

class LifecycleHomePage extends StatefulWidget {
  const LifecycleHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LifecycleHomePage> createState() => _LifecycleHomePageState();
}

class _LifecycleHomePageState extends State<LifecycleHomePage> {

  int _counter = 0;

@override
void dispose(){
  super.dispose();
  print("DIsposed");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TextView(
              counter: _counter,
              onPressedUpdateWidget: () {
                _counter += 1;

                setState(() {});
              },

            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TextView extends StatefulWidget {
  TextView({
    Key? key,
    required int counter,
    required this.onPressedUpdateWidget,
  })  : _counter = counter,
        super(key: key);

  final int _counter;
  final Function onPressedUpdateWidget;
  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  int _counter = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _counterProvider=Provider.of<CounterProvider>(context);
    print("didChangeDependencies counter : ${_counterProvider.counter}");
  }
late CounterProvider _counterProvider;
  @override
  void didUpdateWidget( TextView oldWidget) {
    super.didUpdateWidget(oldWidget);

    print("didUpdateWidget New Value : ${widget._counter} ,Old Value: ${oldWidget._counter} ");
  }
  @override
  void dispose() {
    super.dispose();
print("Dispose");
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            ' Update Widget counter : ${widget._counter}',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' Change Dependency counter : ${_counterProvider.counter}',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () => widget.onPressedUpdateWidget(),
              child: const Text("Increment Update Widget")),
          ElevatedButton(
              onPressed: () {
                _counterProvider.decrementCounter();
              },
              child: const Text("Decrement Change Dependency")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,  MaterialPageRoute(builder: (context) =>  DeactivateDemoScreen()),);
              },
              child: const Text("Push Deactivate Demo Screen"))
        ],
      ),
    );
  }
}
