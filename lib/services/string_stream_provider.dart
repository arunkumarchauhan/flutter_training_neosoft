import 'dart:async';

import 'package:flutter/material.dart';

class CounterStreamGenerator {
  StreamController<int> _countStreamController = StreamController.broadcast();
  Stream<int> get counterStream {
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   _count++;
    //   if (!_countStreamController.isClosed) {
    //     _countStreamController.sink.add(_count);
    //   }
    // });

    return _countStreamController.stream.asBroadcastStream();
  }

  int _count = 0;
  Stream<String> generateStream() async* {
    int count = 0;
    while (count < 100) {
      Future.delayed(const Duration(seconds: 1), () {
        count++;
        print(count);
      });
      yield count.toString();
    }
  }

  void incrementStreamCount() {
    _count++;
    print("called");
    if (!_countStreamController.isClosed)
      _countStreamController.sink.add(_count);
  }

  void disposeCountStream() {
    _countStreamController.close();
  }
}
