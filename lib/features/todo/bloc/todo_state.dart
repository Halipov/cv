part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoLoading extends TodoState {}

final class TodoLoaded extends TodoState {
  const TodoLoaded({required this.todoList});
  final List<Todo> todoList;

  @override
  List<Object> get props => [todoList];
}
