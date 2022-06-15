import 'package:flutter/material.dart';
import 'package:training/screens/navigator/book_app.dart';
import 'package:training/screens/navigator/copy_navigator_boor_route.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';

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

           _buildElevatedButton("Push Unnamed Route", () async {
             var data = await Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => const NavigatorSecondScreen()));
             print(data);
           }),
        _buildElevatedButton("Push Named Route Retrieve Data in",  () async {
          var data = await Navigator.pushNamed(
              context, NavigatorSecondScreen.url,
              arguments: "Data from First Screen Named Push");
          print(data);
        }),

          _buildElevatedButton("Push Named Route Retrieve Data in Ongenerated ROute", ()async {
            var data = await Navigator.pushNamed(
                context, NavigatorThirdScreen.url,
                arguments:
                "Data from First Screen pushNamed onGeneratedRoute");
            print(data);
          }),
            _buildElevatedButton( "Push Named Route Retrieve id from url in Ongenerated Route",() async {
              var data = await Navigator.pushNamed(
                  context, NavigatorThirdScreen.url+"/2",
                  arguments:
                  "onGenerated Route parse ID");
              print(data);
            }),
            _buildElevatedButton("Navigator 2.0 Pages", (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookAppPages()));
            }),
            _buildElevatedButton("Navigator 2.0 Router", (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BooksAppCopy()));
            })
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton( String text,Function onTap){
    return  Container(
      width: double.infinity,
      child: ElevatedButton(

        onPressed: ()=>onTap(),
        child:  Text(text),
      ),
    );
  }
}
