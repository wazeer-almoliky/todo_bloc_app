import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_state.dart';
import 'package:todo_bloc_app/blocs/theme_bloc/theme_bloc_bloc.dart';
import 'package:todo_bloc_app/screens/archivetasks_screen.dart';
import 'package:todo_bloc_app/screens/tasks_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Drawer(
        child: Column(
          children: [
           const Text('المهـــام',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 183, 63, 65)),),
           const SizedBox(height: 12,),
           const Divider(),
           BlocBuilder<TaskBloc,TasksState>(builder: (context,state){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ArchiveTask()));
                Navigator.of(context).pop(); //to close the drawer
              },
              child: Row(
                children: [
                  const SizedBox(width: 6,),
                  const Icon(Icons.task),
                  const SizedBox(width: 12,),
                  const Text("المهـام المؤرشفة",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const Spacer(flex: 2,),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 183, 63, 65),
                    child: Text("${state.archiveTasks.length}",style: const TextStyle(fontSize: 19,color: Colors.white),),),
                  
                  const Spacer(flex: 1,),
                ],
              ),
            );
           }),
           const SizedBox(height: 12,),
           const Divider(),
           BlocBuilder<TaskBloc,TasksState>(builder: (context,state){
            return GestureDetector(
              onTap: (){
                // Navigator.of(context).pushReplacementNamed(TaskScreen.routeName);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  TaskScreen()));
              },
              child: Row(
                children: [
                  const SizedBox(width: 6,),
                  const Icon(Icons.archive),
                  const SizedBox(width: 12,),
                  const Text("المهـام",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const SizedBox(width: 35,),
                  const Spacer(flex: 3,),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 183, 63, 65),
                    child: Text("${state.allTasks.length}",style: const TextStyle(fontSize: 19,color: Colors.white),),),
                  const Spacer(flex: 1,),
                ],
              ),
            );
           }),
  
            const SizedBox(height: 30,),
           const Divider(),
           BlocBuilder<ThemeBlocBloc,ThemeBlocState>(builder: (context,state){
            return SwitchListTile(value: state.swich, onChanged: (val){
              val? context.read<ThemeBlocBloc>().add(SwitchOn()): context.read<ThemeBlocBloc>().add(SwitchOff());
            },
           title: const Text("الثيـم",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
           );
           }),
           
          ],
        ),
      ),
    );
  }
}