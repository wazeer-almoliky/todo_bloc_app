import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_event.dart';
import 'package:todo_bloc_app/blocs/bloc/task_state.dart';
import 'package:todo_bloc_app/models/task.dart';
class ArchiveTask extends StatelessWidget {
  static const  String routeName = "/archive-task";
  const ArchiveTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المهـام المؤرشفة",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 183, 63, 65),
      ),
      body: BlocBuilder<TaskBloc, TasksState>(builder: (context, state) {
        final List<Task> all = state.archiveTasks;
        return Column(
          children: [
            const SizedBox(height: 12,),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: all.length,
                  itemBuilder: (context, index) {
                    final task =all[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 228, 228),//Color((math.Random().nextDouble() * 0xDCC6C6).toInt()).withOpacity(1.0),
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 9,horizontal: 12),
                        title: Text(all[index].title,style: const TextStyle(color: Color.fromARGB(255, 183, 63, 65),fontWeight: FontWeight.w900),),
                        trailing: Checkbox(value: all[index].isDone, onChanged: (val){
                          context.read<TaskBloc>().add(UpdateTask(task: task));
                        },activeColor: const Color.fromARGB(255, 183, 63, 65),),                      
                      leading: const Icon(Icons.star_border),
                      // onLongPress: (){context.read<TaskBloc>().add(DeleteTask(task: task));},
                      ),
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}