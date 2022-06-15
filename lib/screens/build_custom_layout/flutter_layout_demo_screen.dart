import 'package:flutter/material.dart';
import 'package:training/screens/build_custom_layout/widgets/icon_label.dart';

class LayoutDemoScreen extends StatelessWidget {
  static const String url = "LAYOUT_DEMO_SCREEN";

  LayoutDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLutter Layout Demo"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              "assets/lake.jpg",
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: const Text(
              "Oieschemen Lake Campground",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: const Text("Kandersteg, Switzerland"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.star,
                  size: 24,
                  color: Colors.red,
                ),
                Text("41")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              IconWithLabel(icon: Icons.call, text: "Call"),
              IconWithLabel(icon: Icons.navigation, text: "Route"),
              IconWithLabel(icon: Icons.share, text: "Share")
            ],
          ),
          textSection
        ],
      ),
    );
  }

  Widget textSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}
