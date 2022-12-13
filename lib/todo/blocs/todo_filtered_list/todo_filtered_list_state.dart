part of 'todo_filtered_list_bloc.dart';

class TodoFilteredListState extends Equatable {
  final List<TodoModel> todos;
  const TodoFilteredListState({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoFilteredListState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoFilteredListState(
      todos: todos ?? this.todos,
    );
  }

  factory TodoFilteredListState.initial() {
    return const TodoFilteredListState(todos: []);
  }
}
