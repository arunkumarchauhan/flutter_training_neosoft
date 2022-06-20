import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/models/db_demo/moor_db.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class MoorDemoScreen extends StatefulWidget {
  const MoorDemoScreen({Key? key}) : super(key: key);
  static const String url = "MOOR_DB_DEMO_SCREEN";
  @override
  State<MoorDemoScreen> createState() => _MoorDemoScreenState();
}

class _MoorDemoScreenState extends State<MoorDemoScreen> {
  AppDatabase? _appDatabase;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: Builder(builder: (context) {
        _appDatabase = Provider.of<AppDatabase>(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("Moor Db Demo Screen"),
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
                  int res = await _appDatabase!.insertNote(MoorNoteCompanion(
                      id: Value.absent(),
                      description: Value<String>(_textEditingController.text)));
                  if (res > 0) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Note Saved")));
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to save")));
                  }
                }),
                FutureBuilder<List<MoorNoteData>>(
                    future: _appDatabase!.notes,
                    builder: (BuildContext contxt, AsyncSnapshot snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        List<MoorNoteData> notes = snapshot.data;
                        return Column(
                          children: List<Widget>.from(notes.map((e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(e.description),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        int res =
                                            await _appDatabase!.deleteNote(e);

                                        if (res > 0) {
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 24,
                                      ))
                                ],
                              ))),
                        );
                      }
                      return const Center(child: Text("Nothing to Show"));
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
