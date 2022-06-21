import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:training/models/either_task/either_task_model.dart';
import 'package:training/models/networking/dio_demo_model.dart';
import 'package:training/provider/post_notifier.dart';
import 'package:training/services/dio_request.dart';

class UserNotifier extends ChangeNotifier {
  DioClient _dioClient = DioClient();
  Either<Failure, PageInfo>? _pageinfo;
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  Either<Failure, PageInfo> get pageInfo => _pageinfo!;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void _setPageInfo(Either<Failure, PageInfo> pageInfo) {
    _pageinfo = pageInfo;
    notifyListeners();
  }

  void getPageInfo() async {
    _setState(NotifierState.loading);
    await Task(() => _dioClient.getUsers())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => _setPageInfo(value as Either<Failure, PageInfo>));
    _setState(NotifierState.loaded);
  }
}
