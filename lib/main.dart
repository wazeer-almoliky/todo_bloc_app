import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/blocs/bloc/task_bloc.dart';
import 'package:todo_bloc_app/blocs/theme_bloc/theme_bloc_bloc.dart';
import 'package:todo_bloc_app/screens/tasks_screen.dart';
import 'package:todo_bloc_app/service/route_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>TaskBloc()),
        BlocProvider(create: (context) =>ThemeBlocBloc()),
      ],
      
      child: BlocBuilder<ThemeBlocBloc,ThemeBlocState>(
      builder: (context,state){
        return MaterialApp(
        title: 'المهـــام',
        debugShowCheckedModeBanner: false,
       theme: state.swich ? ThemeData.dark(): ThemeData.light(),
        onGenerateRoute: RoutePage().onGenerateRoute,
        home:TaskScreen(),
      );
      },
      ),
    );
  }
}
