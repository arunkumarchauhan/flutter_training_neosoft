import 'dart:io';

import 'package:dio/dio.dart';
import 'package:training/models/either_task/either_task_model.dart';
import '../models/networking/dio_demo_model.dart';
import '../utils/retry_on_connection_change.dart';

class DioClient {
  final Dio _dio = Dio();
  final String kBaseUrl = "https://reqres.in/api";
  final String kUsersSubUrl = "/users";

  Future<PageInfo> getUsers() async {
    _dio.interceptors.add(RetryOnConnectionChange(_dio));

    try {
      Response response = await _dio.get(kBaseUrl + kUsersSubUrl);
      return PageInfo.fromJson(response.data);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure("Network Not Found");
      }
      if (e.response != null) {
        throw Failure("Failure : ${e.type}");
      } else {
        throw Failure("Failure 1 : ${e.error}");
      }
    }
  }
}
