import 'package:flutter/material.dart';

class CategoryItemModel {
  final IconData icon;
  final String text;
  List<Unit> _inputUnits = [];
  List<Unit> _outputUnits = [];
  final Color color;

  CategoryItemModel(this.icon, this.text, this.color);

  set inputUnits(List<Unit> units) => this._inputUnits = units;

  List<Unit> get inputUnits => List.unmodifiable(this._inputUnits);

  set outputUnits(List<Unit> units) => this._outputUnits = units;

  List<Unit> get outputUnits => List.unmodifiable(this._outputUnits);

  static List<CategoryItemModel> get categoryItems {
    return <CategoryItemModel>[
      CategoryItemModel(Icons.scale, "Length", Colors.green),
      CategoryItemModel(Icons.area_chart_outlined, "Area", Colors.blue),
      CategoryItemModel(Icons.volume_down, "Volume", Colors.greenAccent),
      CategoryItemModel(Icons.line_weight, "Weight", Colors.blueGrey),
      CategoryItemModel(Icons.watch, "Time", Colors.grey),
      CategoryItemModel(Icons.memory, "Digital Storage", Colors.yellow),
      CategoryItemModel(
          Icons.energy_savings_leaf, "Energy", Colors.yellowAccent),
      CategoryItemModel(Icons.currency_bitcoin, "Currency", Colors.redAccent)
    ];
  }
}

class Unit {
  String name;
  double conversion;

  Unit(this.name, this.conversion);

  String toString() => "$name";
}
