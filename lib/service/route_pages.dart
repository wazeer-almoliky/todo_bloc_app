import 'package:flutter/material.dart';
import 'package:todo_bloc_app/screens/archivetasks_screen.dart';
import 'package:todo_bloc_app/screens/tasks_screen.dart';

class RoutePage {
  Route? onGenerateRoute(RouteSettings outeSettings){
    switch (outeSettings.name) {
      case ArchiveTask.routeName:
        MaterialPageRoute(builder: (_)=> const ArchiveTask());
        break;
      case TaskScreen.routeName:
        MaterialPageRoute(builder: (_)=>  TaskScreen());
        break;
      
    }
    return null;
  }
}