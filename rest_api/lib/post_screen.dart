import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import 'package:rest_api/utils/services/api_service.dart';
import "package:http/http.dart" as http;



class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController postIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  
  ApiService apiService=ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Text("Post Id :")),
              Expanded(child: TextField(controller: postIdController)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Id :")),
              Expanded(child: TextField(controller: idController)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Name :")),
              Expanded(child: TextField(controller: nameController)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Email :")),
              Expanded(child: TextField(controller: emailController)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Body :")),
              Expanded(child: TextField(controller: bodyController)),
            ],
          ),
          ElevatedButton(onPressed: () {sendData();}, child: Text("Send"))
        ],
      ),
    );
  }

  void sendData() async{
     CommentsModel model= CommentsModel(
      postId: int.parse(postIdController.text),
      id: int.parse(idController.text),
      name:nameController.text,
      body: bodyController.text,
      email: emailController.text,

     );
     final resp= await apiService.postComment(model);
     if(resp.statusCode==HttpStatus.created){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Successfully Created")),
      );
     Navigator.of(context).pop();
     }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("failed to  create"))
        );
      }
    print('${resp.statusCode} mehmet');


   
  }
}
