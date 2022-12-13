part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todos;
  const TodoListState({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  factory TodoListState.initial() {
    return TodoListState(
      todos: [
        TodoModel(id: '1', desc: 'Do the dishes'),
        TodoModel(id: '2', desc: 'Clean the room'),
        TodoModel(id: '3', desc: 'Mow the lawn'),
      ],
    );
  }
}
