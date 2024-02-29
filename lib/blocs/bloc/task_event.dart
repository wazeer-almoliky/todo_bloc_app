import 'package:equatable/equatable.dart';

import 'package:todo_bloc_app/models/task.dart';
abstract class TasksEvent extends Equatable{
  const TasksEvent();
  @override
  List<Object?> get props => [];
}
class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}
class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}
class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}
class ArchievTask extends TasksEvent {
  final Task task;
  const ArchievTask({
    required this.task,
  });
  @override
  List<Object?> get props => [task];
}
