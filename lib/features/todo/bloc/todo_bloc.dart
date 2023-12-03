import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/domain/repository/todo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required ITodoRepository todoRepository})
      : _persistenceTodoRepository = todoRepository,
        super(TodoLoading()) {
    on<AddToDoEvent>(_onAddToDoEventt);
    on<FetchToDosEvent>(_onFetchToDosEvent);
    on<UpdateToDoEvent>(_onUpdateTodoEvent);
    on<DeleteToDoEvent>(_onDeleteTodoEvent);
  }
  final ITodoRepository _persistenceTodoRepository;

  Future<void> _onAddToDoEventt(
    AddToDoEvent event,
    Emitter<TodoState> emit,
  ) async {
    await _persistenceTodoRepository.insertTodo(event.todo);
    add(const FetchToDosEvent());
  }

  Future<void> _onFetchToDosEvent(
    FetchToDosEvent event,
    Emitter<TodoState> emit,
  ) async {
    final todos = await _persistenceTodoRepository.fetchAllToDo();
    emit(TodoLoaded(todoList: todos));
  }

  Future<void> _onUpdateTodoEvent(
    UpdateToDoEvent event,
    Emitter<TodoState> emit,
  ) async {
    await _persistenceTodoRepository.updateTodo(event.todo);
  }

  Future<void> _onDeleteTodoEvent(
    DeleteToDoEvent event,
    Emitter<TodoState> emit,
  ) async {
    await _persistenceTodoRepository.deleteTodo(event.todo);
    add(const FetchToDosEvent());
  }
}
