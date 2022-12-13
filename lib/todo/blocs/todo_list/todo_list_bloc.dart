import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoListEvent>(_addTodo);
    on<UpdateTodoListEvent>(_updateTodo);
    on<ToggleodoListEvent>(_toggleTodo);
    on<DeleteTodoListEvent>(_deleteTodo);
  }

// -----------------------------------------------------------------------------
  void _addTodo(AddTodoListEvent event, Emitter<TodoListState> emit) {
    final newTodo = TodoModel(desc: event.newDesc);
    final newTodoList = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodoList));
  }

  // -----------------------------------------------------------------------------
  void _updateTodo(UpdateTodoListEvent event, Emitter<TodoListState> emit) {
    final newTodoList = state.todos.map((todo) {
      if (todo.id == event.todoId) {
        return TodoModel(
            id: event.todoId, desc: event.newDesc, isDone: todo.isDone);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodoList));
  }

  // -----------------------------------------------------------------------------
  void _toggleTodo(ToggleodoListEvent event, Emitter<TodoListState> emit) {
    final newTodoList = state.todos.map((todo) {
      if (todo.id == event.todoId) {
        return TodoModel(
            id: event.todoId, desc: todo.desc, isDone: !todo.isDone);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodoList));
  }

  // -----------------------------------------------------------------------------
  void _deleteTodo(DeleteTodoListEvent event, Emitter<TodoListState> emit) {
    final newTodoList =
        state.todos.where((todo) => todo.id != event.todoId).toList();

    emit(state.copyWith(todos: newTodoList));
  }
}
