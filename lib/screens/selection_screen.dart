import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/main.dart';
import 'package:training/provider/theme_manager_provider.dart';
import 'package:training/screens/build_custom_layout/flutter_layout_demo_screen.dart';
import 'package:training/screens/build_your_own_widget/category.dart';
import 'package:training/screens/lifecycle/lifecycle.dart';
import 'package:training/screens/local_db_demo/local_db_demo.dart';
import 'package:training/screens/navigator/navigate_first_screen.dart';
import 'package:training/screens/networking/networking_demo.dart';
import 'package:training/screens/responsive/responsive_demo.dart';
import 'package:training/screens/slivers/sliver_screen.dart';
class SelectionScreen extends StatelessWidget {
  static const String url = "SELECTION_SCREEN";

  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeManager _themeManager=Provider.of<ThemeManager>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Selection Screen"),actions: [Switch(value: _themeManager.themeMode==ThemeMode.dark,onChanged: (bool isDark){
          _themeManager.toggleTheme(isDark);
        },)],),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ScreenSelectionButton(
                url: Category.url,
              ),
              ScreenSelectionButton(
                url: SliverScreen.url,
              ),
              ScreenSelectionButton(
                url: LayoutDemoScreen.url,
              ),
              ScreenSelectionButton(
                url: NavigatorFirstScreen.url,
              ),
              ScreenSelectionButton(
                url: LifecycleApp.url,
              ),
              ScreenSelectionButton(
                url: ResponsiveDemo.url,
              ),
              ScreenSelectionButton(
                url: NetworkingDemo.url,
              ),
              ScreenSelectionButton(
                url: LocalDbDemoScreen.url,
              )
            ],
          ),
        ));
  }
}

class ScreenSelectionButton extends StatelessWidget {
  const ScreenSelectionButton({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, url);
      },
      child: Material(
        child: InkWell(
          splashColor: Colors.blueAccent,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: Colors.amberAccent, width: 5)),
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              child: Text(
                url,
                style: const TextStyle(fontSize: 18),
              )),
        ),
      ),
    );
  }
}
