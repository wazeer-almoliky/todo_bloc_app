import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_event.dart';
import 'package:todo_bloc_app/blocs/bloc/task_state.dart';
import 'package:todo_bloc_app/models/task.dart';
class TaskBloc extends Bloc<TasksEvent,TasksState>{
  TaskBloc():super(const TasksState()){
    on<AddTask>(_addTask);
    on<UpdateTask> (_updateTask);
    on<DeleteTask> (_deleteTask);  
    on<ArchievTask> (_archieveTask);  
  }
  void _addTask(AddTask event, Emitter<TasksState> emit){
    final t = state;
    emit(TasksState(allTasks: List.from(t.allTasks)..add(event.task)));
  }
  void _updateTask(UpdateTask event, Emitter<TasksState> emit){
    final st = state;
    final task =event.task;
    final index = st.allTasks.indexOf(task);
    List<Task> all =List.from(st.allTasks)..remove(event.task);
    task.isDone==false? all.insert(index,task.copyWith(isDone: true))
    : all.insert(index,task.copyWith(isDone: false));
    emit(TasksState(allTasks: all) );
  }
  void _deleteTask(DeleteTask event, Emitter<TasksState> emit){
    final t = state;
    emit(TasksState(
      archiveTasks: List.from(t.archiveTasks)..add(event.task.copyWith(isDelete: true)),
      allTasks: List.from(t.allTasks)..remove(event.task),
      ));
    // emit(TasksState(allTasks: List.from(t.allTasks)..remove(event.task)));
  }
  void _archieveTask(ArchievTask event, Emitter<TasksState> emit){
    final t = state;
    emit(TasksState(archiveTasks: List.from(t.archiveTasks)..add(event.task.copyWith(isDelete: true))));
  }
}