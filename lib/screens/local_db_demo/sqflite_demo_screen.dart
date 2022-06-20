import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:training/models/db_demo/notes.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class SqfliteDemoScreen extends StatefulWidget {
  const SqfliteDemoScreen({Key? key}) : super(key: key);
  static const String url = "SQFLITE_DEMO_SCREEN";
  @override
  State<SqfliteDemoScreen> createState() => _SqfliteDemoScreenState();
}

class _SqfliteDemoScreenState extends State<SqfliteDemoScreen> {
  static const String url = "SQFLITE_DEMO_SCREEN";
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite Demo Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 150,
                child: TextField(
                  controller: _textEditingController,
                )),
            buildElevatedButton("SAVE NOTE", () async {
              if (_textEditingController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: const Text("Textfield cannot be empty")));
                return;
              }
              DatabaseHelper database = await DatabaseHelper.instance;
              int res = await database.saveNote(_textEditingController.text);
              if (res >= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: const Text("Note Added")));
                _textEditingController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: const Text("Something Went wrong")));
              }
              setState(() {});
            }),
            FutureBuilder<List<Note>>(
                future: DatabaseHelper.instance.getAllNotes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Note> notes = snapshot.data;
                    return Column(
                      children: List<Widget>.from(notes.map((e) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e.description),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    final DatabaseHelper dbHelper =
                                        DatabaseHelper.instance;
                                    int res = await dbHelper.delete(e.id!);
                                    if (res >= 0) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Note : ${e.description} deleted")));
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 24,
                                  ))
                            ],
                          ))).toList(),
                    );
                  }
                  return Center(child: Text("No Notes to display"));
                })
          ],
        ),
      ),
    );
  }
}
