import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class CounterProvider extends ChangeNotifier{
  int _counter=10;
  int get counter=>_counter;
  void decrementCounter(){
    _counter-=1;
    notifyListeners();
  }
}