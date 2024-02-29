import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/models/task.dart';

class TasksState extends Equatable{
  final List<Task> allTasks;
  final List<Task> archiveTasks;
  const TasksState({this.allTasks=const <Task>[],this.archiveTasks=const <Task>[]});
  
  @override
  List<Object?> get props => [allTasks,archiveTasks];
}