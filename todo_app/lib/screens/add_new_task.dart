import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
      TextEditingController titleController= TextEditingController();
      TextEditingController userIdController= TextEditingController();
      TextEditingController timeContoller= TextEditingController();
      TextEditingController descriptionController=TextEditingController();
      Tasktype  tasktype=Tasktype.note; 
                   
       TodoService todoService=TodoService(); 

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height / 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 136, 96, 82),
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: deviceHeight,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Add New Task",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 20),
                child: Text("Task Title"),
              ),
              Padding(
                padding: EdgeInsets.symmetric( horizontal: 40),
                child: TextField(
                       controller:titleController  ,
                  decoration: const  InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Category,"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(duration: Duration(milliseconds: 300),content: Text("Category Selected")),
                        );
                        setState(() {
                          tasktype=Tasktype.note;
                        });
                      },
                      child: Image.asset("lib/assets/images/category.png"),
                    ),
                     GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(duration: Duration(milliseconds: 300),content: Text("Category Selected")),
                        );
                        setState(() {
                          tasktype=Tasktype.calendar;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category1.png"),
                    ),
                     GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(duration: Duration(milliseconds: 300),content: Text("Category Selected")),
                        );
                        setState(() {
                          tasktype=Tasktype.contest;
                        });
                      },
                      child: Image.asset("lib/assets/images/Category2.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(top:10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("User Id"),
                          Padding(padding: EdgeInsetsGeometry.only(left: 20,right: 20),child: TextField(controller:userIdController ,decoration: InputDecoration(filled:true,fillColor: Colors.white ),))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Time"),
                          Padding(padding: EdgeInsetsGeometry.only(left: 20,right: 20),child: 
                           TextField(controller:timeContoller ,decoration:InputDecoration(filled: true,fillColor: Colors.white) ,))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             Padding(padding: EdgeInsets.only(top:10),child: Text("Description")),

               SizedBox(height: 300, child: Padding(padding: EdgeInsetsGeometry.only(left: 20,right: 20),child: TextField(controller: descriptionController , expands:true,minLines:null,maxLines: null  ,decoration: InputDecoration(filled:true,fillColor: Colors.white ),))),
               ElevatedButton(onPressed: () {
                saveTodo(); 
                Navigator.pop(context);
               }, child: Text("Save"))
                      
               
          
            ],
          ),
        ),
      ),
    );
  }
  void saveTodo(){
    Todo newTodo=Todo(id: -1, todo: descriptionController.text, completed: false, userId:int.parse(userIdController.text));
     todoService.addTodo(newTodo);
  }
}
