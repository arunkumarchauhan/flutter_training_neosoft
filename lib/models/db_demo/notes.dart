import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;


class Note{
  
  int? id;
  String description;
  Note({this.id,required this.description});
  static List<String> get columns=>["id","description"];
  factory  Note.fromJson(Map<String,dynamic> json)=>Note(id: json.containsKey("id")?json["id"]:null,description:json["description"]);
Map<String,dynamic> toJson(){
  return {"id":this.id,"description":this.description};
}

static List<Note>notesFromJson(List list ){
  return List<Note>.from(list.map((e) =>Note.fromJson(e as Map<String,dynamic>)));
}
static List<Map<String,dynamic>> noteToJson(List<Note> list){

 return List<Map<String,dynamic>>.from(list.map((e) => e.toJson()));
}
}

const String dbName="notes_db.db";
const String tableName="NOTES_TABLE";




class DatabaseHelper{

DatabaseHelper._();
 static Database? _database;

 Future<Database> get database async{
   if(_database!=null) return _database!;
   _database=await initDatabase();
   return _database!;
 }

 static DatabaseHelper instance=DatabaseHelper._();

Future<Database>initDatabase()async{
  Directory documentDirectory=await path_provider.getApplicationDocumentsDirectory();
String path=p.join(documentDirectory.path,dbName);

return await openDatabase(path,version: 1,onOpen: (db){},onCreate: (Database db,int version)async{
  await db.execute("CREATE TABLE $tableName( id INTEGER PRIMARY KEY AUTOINCREMENT,description TEXT)");

});
}
 Future<List<Note>> getAllNotes() async {
   final db = await database;
   List<Map> results = await db.query(tableName, columns: Note.columns, orderBy: "id ASC");

   List<Note> notes =[];
   results.forEach((result) {
     Note note = Note.fromJson(result as Map<String,dynamic>);
     notes.add(note);
   });

   return notes;
 }
 Future<int>saveNote(String note)async{
  final db=await database;

  var result = await db.rawInsert(
      "INSERT Into $tableName (id, description)"
          " VALUES (?, ?)",
      [null, note]
  );
  return result;

 }
 Future<void>closeDB()async{
  final db=await database;
  db.close();
 }
Future<int> delete(int id) async {
  Database db = await instance.database;
  return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
}

}