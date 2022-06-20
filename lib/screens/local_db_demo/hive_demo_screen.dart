import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:training/models/db_demo/hive_note.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class HiveDemoScreen extends StatefulWidget {
  const HiveDemoScreen({Key? key}) : super(key: key);
  static const String url = "HIVE_DEMO_SCREEN";
  @override
  State<HiveDemoScreen> createState() => _HiveDemoScreenState();
}

class _HiveDemoScreenState extends State<HiveDemoScreen> {
  TextEditingController _textEditingController = TextEditingController();
  // final Box hivebox = Hive.box("notes");

  @override
  void dispose() {
    super.dispose();

    //CLoses all the hive boxes
    // Hive.close();
    //Closes specified hive box
    Hive.box("notes").close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Demo Screen"),
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
              _addNote(_textEditingController.text);
              _textEditingController.clear();
              setState(() {});
            }),
            buildColumn(Boxes.notes.values, context)
          ],
        ),
      ),
    );
  }

  void _addNote(String description) {
    final HiveNote hiveNote = HiveNote()..description = description;
    Boxes.notes.add(hiveNote);
  }

  Column buildColumn(Iterable<HiveNote> notes, BuildContext context) {
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
                    setState(() {
                      e.delete();
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 24,
                  ))
            ],
          ))).toList(),
    );
  }
}
