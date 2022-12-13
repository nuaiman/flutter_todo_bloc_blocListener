// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeTodoFilterEvent extends TodoFilterEvent {
  final Filter filter;
  const ChangeTodoFilterEvent({required this.filter});

  @override
  String toString() => 'ChangeTodoFilterEvent(filter: $filter)';

  @override
  List<Object> get props => [filter];
}
