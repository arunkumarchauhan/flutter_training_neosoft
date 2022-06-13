import 'package:flutter/material.dart';

class CategoryItemModel {
  final IconData icon;
  final String text;
  CategoryItemModel(this.icon, this.text);

  static List<CategoryItemModel> get categoryItems {
    return <CategoryItemModel>[
      CategoryItemModel(Icons.scale, "Length"),
      CategoryItemModel(Icons.area_chart_outlined, "Area"),
      CategoryItemModel(Icons.volume_down, "Volume"),
      CategoryItemModel(Icons.line_weight, "Weight"),
      CategoryItemModel(Icons.watch, "Time"),
      CategoryItemModel(Icons.memory, "Digital Storage"),
      CategoryItemModel(Icons.energy_savings_leaf, "Energy"),
      CategoryItemModel(Icons.currency_bitcoin, "Currency")
    ];
  }
}
