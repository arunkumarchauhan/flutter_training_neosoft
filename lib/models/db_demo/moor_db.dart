import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'moor_db.g.dart';

class MoorNote extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

@DriftDatabase(tables: [MoorNote])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  //GET All moor notes from db
  Future<List<MoorNoteData>> get notes async {
    return await select(moorNote).get();
  }

//INSERT NEw Note in db
  Future<int> insertNote(MoorNoteCompanion companion) async {
    return await into(moorNote).insert(companion);
  }

  Future<int> deleteNote(MoorNoteData note) async {
    return await delete(moorNote).delete(note);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'moor_db.sqlite'));
    return NativeDatabase(file);
  });
}
