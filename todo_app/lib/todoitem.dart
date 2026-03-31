import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
    final Todo task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
   bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.completed!;
  }

    @override
  Widget build(BuildContext context) {
    return Card(
      color:widget.task.completed! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*  firebase işlemlerşinde geri donuşlecek
           widget.task.type==Tasktype.note ? Image.asset("lib/assets/images/category.png"):
           widget.task.type==Tasktype.contest ? Image.asset("lib/assets/images/Category2.png"):
           Image.asset("lib/assets/images/Category1.png"),
           */
          Image.asset("lib/assets/images/Category1.png"),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(decoration:widget.task.completed! ?  TextDecoration.lineThrough:TextDecoration.none ,fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  Text("userId: ${widget.task.userId!}",style: TextStyle(decoration:TextDecoration.lineThrough),),
                ],
              ),
            ),
           
            Checkbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  widget.task.completed=!widget.task.completed!;

                  isChecked = val!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
