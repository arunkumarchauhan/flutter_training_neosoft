import 'package:flutter/material.dart';
import 'package:training/models/build_your_own_widget/category_model.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({Key? key, required this.model}) : super(key: key);
  final CategoryItemModel model;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late Unit selectedInputValue = widget.model.inputUnits.first;
  late Unit selectedOutputValue = widget.model.outputUnits.first;

  // List of items in our dropdown menu
  @override
  void initState() {
    super.initState();
    // selectedInputValue=widget.model.inputUnits.first;
    // selectedOutputValue=widget.model.outputUnits.first;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.model.color,
      appBar: AppBar(
        backgroundColor: widget.model.color,
        elevation: 0,
        title: Text(
          widget.model.text,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      // labelText: "Input",
                      label:
                          const Text("Input", style: TextStyle(fontSize: 24)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  child: DropdownButton<Unit>(
                      hint: Text(
                        selectedInputValue.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      items: _getInputDropDownItems(),
                      onChanged: (Unit? val) {
                        selectedInputValue = val!;
                        setState(() => {});
                      }),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: TextField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      // labelText: "OutPut",
                      label:
                          const Text("Output", style: TextStyle(fontSize: 24)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  child: DropdownButton<Unit>(
                      hint: Text(
                        selectedOutputValue.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      items: _getOutputDropDownItems(),
                      onChanged: (Unit? val) {
                        selectedOutputValue = val!;
                        setState(() => {});
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<Unit>> _getInputDropDownItems() {
    return List<DropdownMenuItem<Unit>>.from(widget.model.inputUnits
        .map((Unit e) => DropdownMenuItem(value: e, child: Text(e.name)))
        .toList());
  }

  List<DropdownMenuItem<Unit>> _getOutputDropDownItems() {
    return List<DropdownMenuItem<Unit>>.from(widget.model.outputUnits
        .map((Unit e) => DropdownMenuItem(value: e, child: Text(e.name)))
        .toList());
  }
}
