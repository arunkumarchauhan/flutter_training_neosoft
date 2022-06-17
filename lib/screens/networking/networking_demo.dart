import 'package:flutter/material.dart';
import 'package:training/constants.dart';
import 'package:training/models/networking/album.dart';
import '../../services/request.dart' as request;
class NetworkingDemo extends StatelessWidget {
  const NetworkingDemo({Key? key}) : super(key: key);
static const String url="NETWORKING_DEMO";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Networking Demo"),),
      body: FutureBuilder<Map<String,dynamic>>(
        future: request.get(albumUrl),
        builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.done&&snapshot.hasData){
              if(snapshot.data["success"]){
                List<Album>albums=Album.albumsFromJson(snapshot.data["data"] );


              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5), itemBuilder: (context,int index){

                return Image.network(albums[index].url!,
                  errorBuilder: (context,exception,stackTrace)=>Text("${exception.toString()}"),
                  fit: BoxFit.fill,
                );
              });

              }
              else{
                return Container(child: Text(snapshot.data['error']),);
              }
            }
        else if(snapshot.hasError){
            return  Center(child: Text(snapshot.data['error']),);

          }
        else {
          return const Center(child: CircularProgressIndicator());
            }

        },
      ),
    );
  }
}
