import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/features/todo/data/remote/firestore/model/todo_dto.dart';
import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/domain/repository/todo_repository.dart';
import 'package:cv/features/todo/enum/priority_enum.dart';

const collectionName = 'todo';

class FirestoreTodoRepository implements ITodoRepository {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<void> deleteTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection(collectionName).doc(todo.id).delete();
  }

  @override
  Future<List<Todo>> fetchAllToDo() async {
    final collection = await _firestore.collection(collectionName).get();
    final todos = collection.docs.map(
      (e) => ToDoDto.fromJson(e.data()).copyWith(
        id: e.id,
      ),
    );
    return todos
        .map(
          (e) => Todo(
            id: e.id,
            name: e.name,
            description: e.description,
            priorityEnum: PriorityEnum.fromIndex(e.priorityId),
            isDone: e.isDone,
          ),
        )
        .toList();
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection(collectionName).doc(todo.id).set(
          ToDoDto(
            name: todo.name,
            description: todo.description,
            priorityId: todo.priorityEnum.toIndex(),
            isDone: todo.isDone,
          ).toJson(),
        );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection(collectionName).doc(todo.id).update(
          ToDoDto(
            name: todo.name,
            description: todo.description,
            priorityId: todo.priorityEnum.toIndex(),
            isDone: todo.isDone,
          ).toJson(),
        );
  }
}
