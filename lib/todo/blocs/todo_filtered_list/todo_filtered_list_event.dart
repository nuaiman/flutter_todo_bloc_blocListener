part of 'todo_filtered_list_bloc.dart';

abstract class TodoFilteredListEvent extends Equatable {
  const TodoFilteredListEvent();

  @override
  List<Object> get props => [];
}

class CalculateTodoFilteredListEvent extends TodoFilteredListEvent {
  final List<TodoModel> todos;
  const CalculateTodoFilteredListEvent({required this.todos});

  @override
  String toString() => 'CalculateTodoFilteredListEvent(todos: $todos)';

  @override
  List<Object> get props => [todos];
}
