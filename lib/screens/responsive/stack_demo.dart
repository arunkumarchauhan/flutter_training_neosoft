import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);
static const String url="STACK_DEMO";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("StackDemo"),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 400,
          color: Colors.teal,

          child: Stack(
            //Overflow  property ?
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            fit: StackFit.loose,
            children: [
              Container(
                color: Colors.blue,
                height: 400,
                width: 300,
              ),
              Positioned(right: 0,bottom: 350,child: Container(color: Colors.red,height: 100,width: 100,)),
              Positioned(right: 0,top: -20,width: 150,child: Container(color: Colors.white,height: 100,width: 100,))
            ],

          ),
        ),
      ),
    );
  }
}
