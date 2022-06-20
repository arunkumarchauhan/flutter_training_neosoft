import 'dart:convert';

class User {
  int? id;
  String? name;
  int? age;
  User({this.id = 0, required this.name, required this.age});
  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: 0, name: json["name"]!, age: json["age"]!);

  Map<String, dynamic> toJson() =>
      {"id": this.id!, "name": this.name!, "age": this.age};
  String toJsonString() => jsonEncode(this.toJson());

  factory User.fromJsonString(String userString) =>
      User.fromJson(jsonDecode(userString));
}
