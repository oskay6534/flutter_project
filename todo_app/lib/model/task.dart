import 'package:todo_app/constants/tasktype.dart';

class Task{
  Task({required this.type, required this.title,required this.description,required this.isCompleted});
  final String title;
  final String description;
  bool isCompleted;
  final Tasktype type;


}