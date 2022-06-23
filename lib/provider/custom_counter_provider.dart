import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get count => _counter;
  void incrementCounter() {
    _counter += 1;
    notifyListeners();
  }
}
