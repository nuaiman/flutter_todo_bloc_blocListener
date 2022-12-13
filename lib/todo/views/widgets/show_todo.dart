import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_bloc_barrel.dart';
import '../../models/todo_model.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});

  List<TodoModel> setFilteredTodos(
      Filter filter, List<TodoModel> todos, String searchTerm) {
    List<TodoModel> filteredList;

    switch (filter) {
      case Filter.active:
        filteredList = todos.where((todo) => !todo.isDone).toList();
        break;
      case Filter.done:
        filteredList = todos.where((todo) => todo.isDone).toList();
        break;
      case Filter.all:
        filteredList = todos;
        break;
    }

    if (searchTerm.isNotEmpty) {
      filteredList = filteredList
          .where((todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }
    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoFilteredListBloc>().state.todos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final filteredTodos = setFilteredTodos(
              context.read<TodoFilterBloc>().state.filter,
              state.todos,
              context.read<TodoSearchBloc>().state.searchTerm,
            );
            context
                .read<TodoFilteredListBloc>()
                .add(CalculateTodoFilteredListEvent(todos: filteredTodos));
          },
        ),
        BlocListener<TodoFilterBloc, TodoFilterState>(
          listener: (context, state) {
            final filteredTodos = setFilteredTodos(
              state.filter,
              context.read<TodoListBloc>().state.todos,
              context.read<TodoSearchBloc>().state.searchTerm,
            );
            context
                .read<TodoFilteredListBloc>()
                .add(CalculateTodoFilteredListEvent(todos: filteredTodos));
          },
        ),
        BlocListener<TodoSearchBloc, TodoSearchState>(
          listener: (context, state) {
            final filteredTodos = setFilteredTodos(
              context.read<TodoFilterBloc>().state.filter,
              context.read<TodoListBloc>().state.todos,
              state.searchTerm,
            );
            context
                .read<TodoFilteredListBloc>()
                .add(CalculateTodoFilteredListEvent(todos: filteredTodos));
          },
        ),
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length,
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemBuilder: (context, index) {
          return todoListTile(context, todos[index]);
        },
      ),
    );
  }

  Widget todoListTile(BuildContext context, TodoModel todo) {
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<TodoListBloc>().add(DeleteTodoListEvent(todoId: todo.id));
      },
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (_) {
            context
                .read<TodoListBloc>()
                .add(ToggleodoListEvent(todoId: todo.id));
          },
        ),
        title: Text(todo.desc),
      ),
    );
  }
}
