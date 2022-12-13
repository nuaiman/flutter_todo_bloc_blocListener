import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_bloc_barrel.dart';
import '../../models/todo_model.dart';
import '../../utils/debounce.dart';

class FilterTodo extends StatelessWidget {
  FilterTodo({super.key});

  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            debounce.run(() {
              context
                  .read<TodoSearchBloc>()
                  .add(SetTodoSearchEvent(newSearchterm: value));
            });
          },
          decoration: const InputDecoration(
            filled: true,
            border: InputBorder.none,
            labelText: 'Search Todo',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.done),
          ],
        ),
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context
            .read<TodoFilterBloc>()
            .add(ChangeTodoFilterEvent(filter: filter));
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 20,
          color: getColor(context, filter),
        ),
      ),
    );
  }

  Color getColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterBloc>().state.filter;
    return filter == currentFilter ? Colors.blue : Colors.grey;
  }
}
