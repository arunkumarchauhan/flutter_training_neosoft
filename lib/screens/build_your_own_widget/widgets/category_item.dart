import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:training/models/build_your_own_widget/category_model.dart';
import 'package:training/screens/build_your_own_widget/category_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.item}) : super(key: key);
  final CategoryItemModel item;

  @override
  Widget build(BuildContext context) {
    item.inputUnits = List.generate(
        5,
        (index) =>
            Unit("${item.text} Input Unit: $index", index.toDouble())).toList();

    item.outputUnits = List.generate(
            5,
            (index) =>
                Unit("${item.text} Output Unit: $index", index.toDouble()))
        .toList();

    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        splashColor: Colors.blueAccent,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(model: item)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                item.icon,
                size: 60,
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                item.text,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
