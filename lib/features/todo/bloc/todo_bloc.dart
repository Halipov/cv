import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/domain/repository/persistence_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final IPersistenceTodoRepository _persistenceTodoRepository;
  TodoBloc({required IPersistenceTodoRepository persistenceTodoRepository})
      : _persistenceTodoRepository = persistenceTodoRepository,
        super(TodoLoading()) {
    on<AddToDoEvent>(_onAddToDoEventt);
    on<FetchToDosEvent>(_onFetchToDosEvent);
    on<UpdateToDoEvent>(_onUpdateTodoEvent);
    on<DeleteToDoEvent>(_onDeleteTodoEvent);
  }

  Future<void> _onAddToDoEventt(AddToDoEvent event, Emitter<TodoState> emit) async {
    await _persistenceTodoRepository.insertTodo(event.todo);
    add(const FetchToDosEvent());
  }

  Future<void> _onFetchToDosEvent(FetchToDosEvent event, Emitter<TodoState> emit) async {
    final todos = await _persistenceTodoRepository.fetchAllToDo();
    emit(TodoLoaded(todoList: todos));
  }

  Future<void> _onUpdateTodoEvent(UpdateToDoEvent event, Emitter<TodoState> emit) async {
    await _persistenceTodoRepository.updateTodo(event.todo);
  }

  Future<void> _onDeleteTodoEvent(DeleteToDoEvent event, Emitter<TodoState> emit) async {
    await _persistenceTodoRepository.deleteTodo(event.todo);
    add(const FetchToDosEvent());
  }
}
