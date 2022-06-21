class Failure {
  String message;
  Failure(this.message);
}

class Post {
  int id;
  int userId;
  String title;
  Post({required this.id, required this.title, required this.userId});
  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json["id"], title: json["title"], userId: json["userId"]);

  Map<String, dynamic> toJson() =>
      {"id": this.id, "userId": this.userId, "title": this.title};
}
