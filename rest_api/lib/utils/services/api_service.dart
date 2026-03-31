import 'dart:convert';

import 'package:rest_api/utils/constants/api_constants.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import "package:http/http.dart" as http;
class ApiService {
  String url1="https://jsonplaceholder.typicode.com/comments";

Future<List<CommentsModel>> getComments() async{
  final response = await http.get(Uri.parse(url1)); 
  print(response.statusCode);             

  List<CommentsModel> comments=[];
  List<dynamic> responseList=jsonDecode(response.body);
  
  for(int i=0;i<responseList.length;i++){
    comments.add(CommentsModel.fromJson(responseList[i]));

  }
    return comments;                          
}

Future<http.Response> postComment(CommentsModel model) async{
  final response= await http.post(
    Uri.parse(url),
    headers: <String,String>{
      "Content-Type":"application/json; charset-UTF-8",

    },
    body:json.encode(model.toJson(),)
  );
return response;
}


}
