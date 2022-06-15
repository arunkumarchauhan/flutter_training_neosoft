import 'package:flutter/material.dart';
import 'package:training/models/build_your_own_widget/category_model.dart';
import 'package:training/screens/build_your_own_widget/widgets/category_item.dart';
import 'package:backdrop/backdrop.dart';

class Category extends StatelessWidget {
  static const String url = "CATEGORY";

  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      revealBackLayerAtStart: true,
      appBar: BackdropAppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: const Text(
          "UNIT CONVERTER",
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      stickyFrontLayer: true,
      backLayer: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 2.5),
              itemCount: CategoryItemModel.categoryItems.length,
              itemBuilder: (context, index) {
                CategoryItemModel categoryModel =
                    CategoryItemModel.categoryItems[index];
                return CategoryItem(
                  item: categoryModel,
                );
              });
        }
        return ListView.builder(
          itemCount: CategoryItemModel.categoryItems.length,
          itemBuilder: (ctx, index) {
            CategoryItemModel categoryModel =
                CategoryItemModel.categoryItems[index];
            return CategoryItem(item: categoryModel);
          },
        );
      }),
      frontLayer: Container(
        color: Colors.white,
      ),
    );
  }
}
