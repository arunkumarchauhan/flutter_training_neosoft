import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({Key? key}) : super(key: key);
  static const  String url="WRAP_DEMO";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wrap "),),
      body: Container(
        height: 300,
        width: 300,
        color: Colors.blue,
        child: Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.spaceEvenly,
          verticalDirection: VerticalDirection.down,
          spacing: 10,
          runSpacing: 30,
          textDirection: TextDirection.rtl,
          children: [
            for (int i=0;i<10;i++)Container(alignment: Alignment.center,height: 50,width: 50,color: Colors.red,child: Text("$i",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),)
          ] ,
        ),
      ),
    );
  }
}
