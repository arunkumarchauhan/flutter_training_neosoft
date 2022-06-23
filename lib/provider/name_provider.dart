import 'package:flutter/material.dart';
import 'package:training/provider/greeting_provider.dart';
import 'package:training/screens/lifecycle/provider/counter_provider.dart';

import 'custom_counter_provider.dart';

class NameProvider extends ChangeNotifier {
  String _name = "";
  String get name => _name;
  late CustomCounterProvider _counterProvider;
  void updateCounterProvider(CustomCounterProvider counterProvider) {
    _counterProvider = counterProvider;
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
