import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:training/models/build_your_own_widget/category_model.dart';
import 'package:training/screens/build_your_own_widget/widgets/category_item.dart';

class Category extends StatelessWidget {
  static const String url = "CATEGORY";
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 100,
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.cancel,
                    size: 24,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("UNIT CONVERTER")
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: CategoryItemModel.categoryItems.length,
              itemBuilder: (ctx, index) {
                CategoryItemModel categoryModel =
                    CategoryItemModel.categoryItems[index];
                return CategoryItem(
                    icon: categoryModel.icon, text: categoryModel.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
