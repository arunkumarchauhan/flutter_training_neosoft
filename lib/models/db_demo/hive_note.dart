import 'package:hive/hive.dart';
part "hive_note.g.dart";

@HiveType(typeId: 0)
class HiveNote extends HiveObject {
  @HiveField(1)
  late String description;
}

class Boxes {
  static Box<HiveNote> get notes => Hive.box<HiveNote>("notes");
}
