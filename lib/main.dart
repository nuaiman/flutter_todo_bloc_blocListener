import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo/blocs/todo_bloc_barrel.dart';
import 'todo/views/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ---------------------------------------------------------------------
        BlocProvider<TodoFilterBloc>(create: (context) => TodoFilterBloc()),
        // ---------------------------------------------------------------------
        BlocProvider<TodoSearchBloc>(create: (context) => TodoSearchBloc()),
        // ---------------------------------------------------------------------
        BlocProvider<TodoListBloc>(create: (context) => TodoListBloc()),
        // ---------------------------------------------------------------------
        BlocProvider<TodoActiveCountBloc>(
            create: (context) => TodoActiveCountBloc(
                  initialActiveCount:
                      context.read<TodoListBloc>().state.todos.length,
                )),
        // ---------------------------------------------------------------------
        BlocProvider<TodoFilteredListBloc>(
            create: (context) => TodoFilteredListBloc(
                  initialTodoList: context.read<TodoListBloc>().state.todos,
                )),
        // ---------------------------------------------------------------------
      ],
      child: MaterialApp(
        title: 'Flutter Todo Bloc StreamSubscription',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
