import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<Map<String,dynamic>>get(String url,{Map<String,dynamic> param=const {}})async{
  
   try{
       http.Response response= await http.get(Uri.parse(url).replace(queryParameters: param)).timeout(const Duration(seconds: 10),onTimeout: (){
           return Future.value(http.Response(convert.jsonEncode({
               "success":false,
               "data":[]
           }),400));
       }).catchError((onError){
           return Future.value(http.Response(convert.jsonEncode({
               "success":false,
               "data":[],
               "error":onError.toString()
           }),400));

       });


       var  body=convert.jsonDecode(response.body);

       if(response.statusCode>=200&&response.statusCode<=300){

           return {
               "success":true,
               "data":body
           };
       }
       else{
           return {"success":false,"data":[],"error":body["error"]??"Something Went Wrong"};
       }
   }
   catch(e){

       return {"success":false,"data":[],"error":e.toString()};
   }
  
  
}