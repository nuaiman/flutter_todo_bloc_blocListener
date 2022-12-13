part of 'todo_active_count_bloc.dart';

abstract class TodoActiveCountEvent extends Equatable {
  const TodoActiveCountEvent();

  @override
  List<Object> get props => [];
}

class GetTodoActiveCountEvent extends TodoActiveCountEvent {
  final int activeCount;
  const GetTodoActiveCountEvent({required this.activeCount});

  @override
  String toString() => 'GetTodoActiveCountEvent(activeCount: $activeCount)';

  @override
  List<Object> get props => [activeCount];
}
