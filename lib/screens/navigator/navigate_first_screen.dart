import 'package:flutter/material.dart';
import 'package:training/screens/navigator/book_app.dart';
import 'package:training/screens/navigator/copy_navigator_boor_route.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class NavigatorFirstScreen extends StatelessWidget {
  const NavigatorFirstScreen({Key? key}) : super(key: key);
  static const String url = "NAVIGATOR_FIRST_SCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator First Screen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           buildElevatedButton("Push Unnamed Route", () async {
             var data = await Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => const NavigatorSecondScreen(),settings: RouteSettings(name: NavigatorSecondScreen.url)));
             print(data);
           }),
        buildElevatedButton("Push Named Route Retrieve Data in",  () async {
          var data = await Navigator.pushNamed(
              context, NavigatorSecondScreen.url,
              arguments: "Data from First Screen Named Push");
          print(data);
        }),

          buildElevatedButton("Push Named Route Retrieve Data in Ongenerated ROute", ()async {
            var data = await Navigator.pushNamed(
                context, NavigatorThirdScreen.url,
                arguments:
                "Data from First Screen pushNamed onGeneratedRoute");
            print(data);
          }),
            buildElevatedButton( "Push Named Route Retrieve id from url in Ongenerated Route",() async {
              var data = await Navigator.pushNamed(
                  context, NavigatorThirdScreen.url+"/2",
                  arguments:
                  "onGenerated Roßute parse ID");
              print(data);
            }),
            buildElevatedButton("Navigator 2.0 Pages", (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookAppPages()));
            }),
            buildElevatedButton("Navigator 2.0 Router", (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BooksAppCopy()));
            })
          ],
        ),
      ),
    );
  }


}
