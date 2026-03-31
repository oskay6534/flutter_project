import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/header.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

//       List<String> todo = ["Study Lesson", "Run 5K", "Go To Party"];
// List<String> completed=["Game meetup","Take out trush","Alice in device"];

List<Task> todo=[Task(type: Tasktype.note, title:"Study Lesson" , description: "Study COMP117", isCompleted: false),
 Task(type: Tasktype.calendar, title:"Run 5K" , description: "Run Forest Run", isCompleted: false),
 Task(type: Tasktype.contest, title:"Go To Party" , description: "Attend to Party", isCompleted: false)
];

List<Task> completed=[
Task(type: Tasktype.note, title:"Study Lesson" , description: "Study COMP117", isCompleted: false),
 Task(type: Tasktype.calendar, title:"Run 5K" , description: "Run Forest Run", isCompleted: false)

];

String  text1= "OSKAY ,2025";
String text2= "My Todo List";
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   void addNewTask(Task newTask){
    setState(() {
      todo.add(newTask);
    });
   }

  @override
  Widget build(BuildContext context) {
    TodoService todoService=TodoService();
    return  SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
               Header(text1: text1, text2: text2),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(future:todoService.getUnCompletedTodos() , builder:(context, snapshot) {
                       if(snapshot.data==null){
                     return CircularProgressIndicator();
                       }
                       else{
                                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                    itemCount: snapshot.data!.length,

                      itemBuilder: (context, index) {
                       return Todoitem(task:snapshot.data![index]);
                      },
                    );    
                       }

                  ;   
                    },
                 
                    
                    
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: SingleChildScrollView(
                    child:FutureBuilder(future:todoService.getCompletedTodos() , builder:(context, snapshot) {
                       if(snapshot.data==null){
                     return CircularProgressIndicator();
                       }
                       else{
                                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                    itemCount: snapshot.data!.length,

                      itemBuilder: (context, index) {
                       return Todoitem(task:snapshot.data![index]);
                      },
                    );    
                       }

                  ;   
                    },
                 
                    
                    
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:(context) => AddNewTaskScreen(
                      addNewTask:(newTask1)=>addNewTask(newTask1) ,
                    ),)
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text("Add a new task"),
              ),
            ],
          ),
        ),
      );


    
  }
 
}