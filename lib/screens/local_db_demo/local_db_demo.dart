import 'package:flutter/material.dart';
import 'package:training/screens/local_db_demo/hive_demo_screen.dart';
import 'package:training/screens/local_db_demo/mooor_demo_screen.dart';
import 'package:training/screens/local_db_demo/sharedpreference_demo_screen.dart';
import 'package:training/screens/local_db_demo/sqflite_demo_screen.dart';
import 'package:training/screens/selection_screen.dart';

class LocalDbDemoScreen extends StatelessWidget {
  static const String url = "LOCAL_DB_DEMO_SCREEN";
  const LocalDbDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local DB Demo"),
      ),
      body: ListView(
        children: const [
          ScreenSelectionButton(url: SqfliteDemoScreen.url),
          ScreenSelectionButton(url: MoorDemoScreen.url),
          ScreenSelectionButton(url: HiveDemoScreen.url),
          ScreenSelectionButton(url: SharedPreferenceDemo.url),
        ],
      ),
    );
  }
}
