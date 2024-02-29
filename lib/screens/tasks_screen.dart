import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_event.dart';
import 'package:todo_bloc_app/blocs/bloc/task_state.dart';
import 'package:todo_bloc_app/models/task.dart';
import 'package:todo_bloc_app/screens/drawer_screen.dart';
// ignore: must_be_immutable
class TaskScreen extends StatelessWidget {
  static const routeName="/TaskScreen";
  TaskScreen({super.key});
 final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('المهـــام',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 183, 63, 65),
        iconTheme: const IconThemeData(color: Colors.white,size: 30),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color.fromARGB(255, 183, 63, 65), 
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        actions: [IconButton(onPressed: (){
          showModalBottomSheet(
              context: context, builder: (context) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
              child: TaskBottomSheet(controller: controller,controller2: controller2,),),
              // backgroundColor: Colors.white,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
              );
        }, icon: const Icon(Icons.add,color: Colors.white,))],
      ),
      body: BlocBuilder<TaskBloc, TasksState>(builder: (context, state) {
        final List<Task> all = state.allTasks;
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
                        subtitle:all[index].isDone! ==true? Wrap(children: [
                          Text(all[index].description
                        ,style: const TextStyle(color: Colors.black,fontSize: 20)
                        )
                        ],):Text(DateTime.now().toString().substring(0,10),style:const TextStyle(fontSize:18,color:Colors.black)),
                        trailing: Checkbox(value: all[index].isDone, onChanged: (val){
                          context.read<TaskBloc>().add(UpdateTask(task: task));
                        },activeColor: const Color.fromARGB(255, 183, 63, 65),),                      
                      leading:  Icon(all[index].isDone! ==false?Icons.star_border:Icons.star,color:all[index].isDone! ?Colors.black:const Color.fromARGB(255, 183, 63, 65),),
                      onLongPress: (){context.read<TaskBloc>().add(DeleteTask(task: task));},
                      ),
                    );
                  }),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 183, 63, 65),
          shape: const CircleBorder(),
          child: const Icon(Icons.add,color: Colors.white,size: 40,),
          onPressed: () {
            showModalBottomSheet(
              context: context, builder: (context) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
              child: TaskBottomSheet(controller: controller,controller2: controller2,),),
              // backgroundColor: Colors.white,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height-200),
              isScrollControlled: true
              );
          }),
    );
  }

  
}

class TaskBottomSheet extends StatelessWidget {
  const TaskBottomSheet({
    super.key,
    required this.controller,
    required this.controller2,
  });

  final TextEditingController controller,controller2;

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize:  MainAxisSize.min,
            children: [
              const Text(
                "اضـافة مهـام",
                style: TextStyle(fontSize: 30,color:  Color.fromARGB(255, 183, 63, 65),fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: "مهــام",
                    label: Text("مهــام",style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 183, 63, 65)),),
                    border: OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 183, 63, 65),width: 2.2)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 183, 63, 65),width: 2.2)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 183, 63, 65),width: 2.2)),
                    ),
                controller: controller,
                validator: (val){
                  return val!.trim().isEmpty?"الحقــل فــارغ...":val.trim().length<8?"غيـر مسمـوح بأقـل من 8 أحـرف":null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                // autofocus: true,
                decoration: const InputDecoration(
                    hintText: "الوصـــف",
                    label: Text("الوصـــف",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 183, 63, 65)),),
                    border: OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 183, 63, 65),width: 2.2)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 183, 63, 65),width: 2.2)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Color.fromARGB(255, 183, 63, 65),width: 2.2)),
                    ),
                controller: controller2,
                validator: (val){
                  return val!.trim().isEmpty?"الحقــل فــارغ...":null;
                },
                minLines: 3,
                maxLines: 5,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text("الغـــاء",style: TextStyle(fontSize: 18,color: Colors.red),)),
                  ElevatedButton(
                      onPressed: () {
                        final task = Task(title: controller.text,description: controller2.text);
                        context.read<TaskBloc>().add(AddTask(task: task));
                        controller.clear();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 183, 63, 65)),
                      child: const Text("حفـــظ",style: TextStyle(fontSize: 18,color: Colors.white))),
                  
                ],
              )
            ],
          ),
        ),
      );
  }
}
