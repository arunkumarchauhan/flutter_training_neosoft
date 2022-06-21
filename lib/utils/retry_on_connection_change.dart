import 'dart:io';

import 'package:dio/dio.dart';
import 'package:training/models/either_task/either_task_model.dart';

class RetryOnConnectionChange extends Interceptor {
  Dio dio;
  RetryOnConnectionChange(this.dio);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // if (_shouldRetry(err)) {
    //   throw Failure("Socket Exception");
    // }
    super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
