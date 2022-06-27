import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class Clock extends StateNotifier<DateTime> {
  late final Timer _timer;

  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    print("TImer Dispose");
    super.dispose();
  }
}

class User {
  String name;
  int age;
  String occupation;
  User({required this.name, required this.age, required this.occupation});
}

class FutureClass {
  Tuple3<String, int, String> tuple3;
  FutureClass(this.tuple3);
  Future<User> getData() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    return User(
        name: tuple3.value1, age: tuple3.value2, occupation: tuple3.value3);
  }
}

final futureClassProvider =
    Provider.family<FutureClass, Tuple3<String, int, String>>(
        (ref, tuple3) => FutureClass(tuple3));

final futureUserProvider = FutureProvider.autoDispose
    .family<User, Tuple3<String, int, String>>(
        (ref, Tuple3<String, int, String> tup3) {
  final futureClass = ref.read(futureClassProvider(tup3));
  return futureClass.getData();
});

class UserStream {
  UserStream();
  StreamController<User> _userStreamController = StreamController();
  StreamController<User> get userStreamController => _userStreamController;
}

final userStreamClassObjectProvider =
    Provider.autoDispose<UserStream>((ref) => UserStream());

final userStreamProvider = StreamProvider.autoDispose<User>((ref) {
  final userStreamObject = ref.watch(userStreamClassObjectProvider);
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (timer.tick <= 50) {
      userStreamObject.userStreamController.sink.add(User(
          name: "User : ${timer.tick}",
          age: timer.tick,
          occupation: "Occupaion : ${timer.tick}"));
    } else {
      timer.cancel();
    }
  });
  return userStreamObject.userStreamController.stream;
});
