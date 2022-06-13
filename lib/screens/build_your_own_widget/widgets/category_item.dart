import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        splashColor: Colors.blueAccent,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
              ),
              const SizedBox(width: 20),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
