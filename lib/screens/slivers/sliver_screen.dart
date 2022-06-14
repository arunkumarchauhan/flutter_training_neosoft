import 'package:flutter/material.dart';
import 'package:training/screens/slivers/widgets/sliver_header.dart';

class SliverScreen extends StatelessWidget {
  static const String url = "SLIVER_DEMO_SCREEN";
  const SliverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 35,)),
            backgroundColor: const Color(0xFFEDF2F8),
            title: const Text(
              "Sliver AppBar",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flexible SpaceBar Title",style: TextStyle(color: Colors.white),),
              background: Image.network(
                  "https://i.picsum.photos/id/773/536/354.jpg?hmac=tVzbxoSGxWOkItAK4DkZeoRoxcB1iKKMYN2xdIsRBqc",
                  fit: BoxFit.cover),
            ),

          ),
          SliverHeader(Colors.red, "SliverPersistentHeader 1"),
          SliverHeader(Colors.blue, "SliverPersistentHeader 2"),
          SliverHeader(Colors.purple, "SliverPersistentHeader 3"),
          SliverList(delegate: SliverChildListDelegate([
            for(int i=0;i<5;i++)
              ListTile(title: Text("SliverList SliverChildListDelegate: $i"),)

          ])),
          SliverList(delegate: SliverChildBuilderDelegate((context,index)=>ListTile(title: Text("SliverList SliverChildBuilderDelegate : $index"),),childCount: 5),),
          SliverFixedExtentList(delegate: SliverChildListDelegate([
            for(int i =0;i<5;i++)Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Text("SliverFIxedExtentList : $i"),),
            )
          ]), itemExtent: 30),
          SliverGrid( delegate: SliverChildBuilderDelegate((context,index){
            return Container(
              color: Colors.red,
              height: 20,
                alignment: Alignment.center,
                child: ListTile(title: Text("SliverGrid SliverChildBuilderDelegate : $index "),));
          },childCount:7),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 1.5))
        ],
      ),
    );
  }
}
