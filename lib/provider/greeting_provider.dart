import 'package:flutter/material.dart';
import 'package:training/provider/custom_counter_provider.dart';
import 'package:training/provider/name_provider.dart';

class GreetingProvider extends ChangeNotifier {
  late CustomCounterProvider _counterProvider;
  late NameProvider _nameProvider;
  String get greeting =>
      "Hello ${_nameProvider.name} You Have Pressed Button ${_counterProvider.count} No of times.";

  void setNameProvider(NameProvider nameProvider) {
    _nameProvider = nameProvider;
    notifyListeners();
  }

  void setCounterProvider(CustomCounterProvider counterProvider) {
    _counterProvider = counterProvider;
    notifyListeners();
  }
}
