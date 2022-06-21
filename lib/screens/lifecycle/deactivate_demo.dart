import 'package:flutter/material.dart';

class DeactivateDemoScreen extends StatefulWidget {
  const DeactivateDemoScreen({Key? key}) : super(key: key);
  static const String url = "DEACTIVATE_DEMO_SCREEN";
  @override
  State<DeactivateDemoScreen> createState() => _DeactivateDemoScreenState();
}

class _DeactivateDemoScreenState extends State<DeactivateDemoScreen> {
  List<String> list = List.generate(10, (index) => "Item : $index");
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = list.removeAt(oldindex);
      list.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deactivate Demo Screen"),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return DeactivateListItem(key: Key(list[index]), text: list[index]);
          },
          itemCount: list.length,
          onReorder: (int oldIndex, int newIndex) {
            reorderData(oldIndex, newIndex);
          }),
    );
  }
}

class DeactivateListItem extends StatefulWidget {
  const DeactivateListItem({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<DeactivateListItem> createState() => _DeactivateListItemState();
}

class _DeactivateListItemState extends State<DeactivateListItem> {
  @override
  void deactivate() {
    super.deactivate();
    print("Deactivate ${widget.text}  Called");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 5, color: Colors.black45),
      ),
      child: Text("${widget.text}"),
    );
  }
}
