import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'todo_active_count_event.dart';
part 'todo_active_count_state.dart';

class TodoActiveCountBloc
    extends Bloc<TodoActiveCountEvent, TodoActiveCountState> {
  final int initialActiveCount;
  TodoActiveCountBloc({required this.initialActiveCount})
      : super(TodoActiveCountState(activeCount: initialActiveCount)) {
    on<GetTodoActiveCountEvent>((event, emit) {
      emit(state.copyWith(activeCount: event.activeCount));
    });
  }
}
