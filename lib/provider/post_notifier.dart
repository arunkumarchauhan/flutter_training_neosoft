import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:training/models/either_task/either_task_model.dart';
import 'package:training/services/post_service.dart';

enum NotifierState { initial, loading, failed, loaded }

class PostNotifier extends ChangeNotifier {
  Either<Failure, Post>? _post;
  Either<Failure, Post> get post => _post!;
  NotifierState _state = NotifierState.initial;
  final PostService _postService = PostService();

  NotifierState get state => _state;

  void _setPost(Either<Failure, Post> post) {
    _post = post;
    notifyListeners();
  }

  void _setState(NotifierState notifierState) {
    _state = notifierState;
    notifyListeners();
  }

  void getOnePost() async {
    _setState(NotifierState.loading);
    await Task(() => _postService.getOnePost())
        .attempt()
        .map((either) {
          return either.leftMap((l) {
            try {
              return l as Failure;
            } catch (e) {
              throw l;
            }
          });
        })
        .run()
        .then((value) {
          _setPost(value as Either<Failure, Post>);
        });
    _setState(NotifierState.loaded);
  }
}

extension TaskX<U, T extends Either<Object, U>> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
