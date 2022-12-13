part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SetTodoSearchEvent extends TodoSearchEvent {
  final String newSearchterm;
  const SetTodoSearchEvent({required this.newSearchterm});

  @override
  String toString() => 'SetTodoSearchEvent(newSearchterm: $newSearchterm)';

  @override
  List<Object> get props => [newSearchterm];
}
