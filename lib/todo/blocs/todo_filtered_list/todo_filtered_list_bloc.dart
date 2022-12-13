import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/todo_model.dart';

part 'todo_filtered_list_event.dart';
part 'todo_filtered_list_state.dart';

class TodoFilteredListBloc
    extends Bloc<TodoFilteredListEvent, TodoFilteredListState> {
  final List<TodoModel> initialTodoList;

  TodoFilteredListBloc({
    required this.initialTodoList,
  }) : super(TodoFilteredListState(todos: initialTodoList)) {
    on<CalculateTodoFilteredListEvent>((event, emit) {
      emit(state.copyWith(todos: event.todos));
    });
  }
}
