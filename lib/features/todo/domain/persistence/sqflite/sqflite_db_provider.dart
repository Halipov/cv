import 'package:cv/features/todo/domain/persistence/sqflite/model/_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService {
  Database? _database;

  Future<void> init() async {
    String path = await getDatabasesPath();

    _database = await openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          '''
          CREATE TABLE "priority" (
          	"id"	INTEGER NOT NULL UNIQUE,
          	"name"	TEXT NOT NULL,
          	PRIMARY KEY("id" AUTOINCREMENT)
          )
          ''',
        );
        await database.execute(
          '''
          CREATE TABLE "todo" (
	          "id"	INTEGER NOT NULL UNIQUE,
	          "name"	TEXT NOT NULL,
	          "description"	TEXT NOT NULL,
	          "priorityId"	INTEGER NOT NULL DEFAULT 0,
	          "isDone"	INTEGER NOT NULL DEFAULT 0,
	          FOREIGN KEY("priorityId") REFERENCES "priority"("id"),
	          PRIMARY KEY("id" AUTOINCREMENT)
          )
          ''',
        );
        await database.execute('''INSERT INTO "priority" ("id", "name") VALUES ('0', 'Low')''');
        await database.execute('''INSERT INTO "priority" ("id", "name") VALUES ('1', 'Medium')''');
        await database.execute('''INSERT INTO "priority" ("id", "name") VALUES ('2', 'High')''');
      },
      version: 1,
    );
  }

  Future<List<ToDoDto>> getAllClients() async {
    var res = await _database!.query("todo");
    List<ToDoDto> list = res.isNotEmpty ? res.map((c) => ToDoDto.fromJson(c)).toList() : [];
    return list;
  }

  Future<int> insertToDo(ToDoDto todo) async {
    final id = await _database!.insert(
      'todo',
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<int> updateToDo(ToDoDto todo) async {
    final resultId = await _database!.update("todo", todo.toJson(), where: "id = ?", whereArgs: [todo.id]);
    return resultId;
  }

  Future<int> deleteTodo(ToDoDto todo) async {
    final resultId = await _database!.delete("todo", where: "id = ?", whereArgs: [todo.id]);
    return resultId;
  }
}
