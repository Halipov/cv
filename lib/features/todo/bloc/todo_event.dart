part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoEvent extends TodoEvent {
  const AddToDoEvent({required this.todo});
  final Todo todo;
}

class DeleteToDoEvent extends TodoEvent {
  const DeleteToDoEvent({required this.todo});
  final Todo todo;
}

class UpdateToDoEvent extends TodoEvent {
  const UpdateToDoEvent({required this.todo});
  final Todo todo;
}

class FetchToDosEvent extends TodoEvent {
  const FetchToDosEvent();
}
