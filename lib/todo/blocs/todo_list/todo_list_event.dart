// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

// -----------------------------------------------------------------------------
class AddTodoListEvent extends TodoListEvent {
  final String newDesc;
  const AddTodoListEvent({required this.newDesc});

  @override
  String toString() => 'AddTodoListEvent(newDesc: $newDesc)';

  @override
  List<Object> get props => [newDesc];
}

// -----------------------------------------------------------------------------
class UpdateTodoListEvent extends TodoListEvent {
  final String todoId;
  final String newDesc;
  const UpdateTodoListEvent({required this.todoId, required this.newDesc});

  @override
  String toString() =>
      'UpdateTodoListEvent(todoId: $todoId, newDesc: $newDesc)';
  @override
  List<Object> get props => [todoId, newDesc];
}

// -----------------------------------------------------------------------------
class ToggleodoListEvent extends TodoListEvent {
  final String todoId;
  const ToggleodoListEvent({required this.todoId});

  @override
  String toString() => 'ToggleodoListEvent(todoId: $todoId)';

  @override
  List<Object> get props => [todoId];
}

// -----------------------------------------------------------------------------
class DeleteTodoListEvent extends TodoListEvent {
  final String todoId;
  const DeleteTodoListEvent({required this.todoId});

  @override
  String toString() => 'DeleteTodoListEvent(todoId: $todoId)';

  @override
  List<Object> get props => [todoId];
}
// -----------------------------------------------------------------------------
