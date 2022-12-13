import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_bloc_barrel.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Todos',
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int activeCount = context
                .read<TodoListBloc>()
                .state
                .todos
                .where((todo) => !todo.isDone)
                .toList()
                .length;
            context
                .read<TodoActiveCountBloc>()
                .add(GetTodoActiveCountEvent(activeCount: activeCount));
          },
          child: Text(
            '${context.watch<TodoActiveCountBloc>().state.activeCount} items left',
            style: const TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
