part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoEvent extends TodoEvent {
  final Todo todo;

  const AddToDoEvent({required this.todo});
}

class DeleteToDoEvent extends TodoEvent {
  final Todo todo;

  const DeleteToDoEvent({required this.todo});
}

class UpdateToDoEvent extends TodoEvent {
  final Todo todo;

  const UpdateToDoEvent({required this.todo});
}

class FetchToDosEvent extends TodoEvent {
  const FetchToDosEvent();
}
