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
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        onTap: () {},
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
