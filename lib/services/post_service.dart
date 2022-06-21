import 'dart:convert';
import 'dart:io';

import 'package:training/models/either_task/either_task_model.dart';

class FakeHttpClient {
  Future<String> getResponseBody() async {
    Future.delayed(const Duration(microseconds: 500));
    // throw SocketException("No Internet");
    // throw HttpException("404");
    // return "abcd";
    //throw FileSystemException();
    return '{"userId":1,"id":1,"title":"Title Data from API","body":"cool body"}';
  }
}

class PostService {
  final FakeHttpClient _fakeHttpClient = FakeHttpClient();
  Future<Post> getOnePost() async {
    try {
      final responseBody = await _fakeHttpClient.getResponseBody();
      print("responseBody : ${json.decode(responseBody)}");
      return Post.fromJson(json.decode(responseBody));
    } on FormatException {
      throw Failure("Bad Response Format");
    } on SocketException {
      throw Failure("No Internet Connection");
    } on HttpException {
      throw Failure("Post Not Found");
    } catch (e) {
      print("Error : ${e.toString()}");
      rethrow;
    }
  }
}
