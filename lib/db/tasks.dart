import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'tasks.freezed.dart';
part 'tasks.g.dart';

Future<void> initTasks(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS tasks (
      id INTEGER PRIMARY KEY,
      total INTEGER,
      done INTEGER
    )
  ''');
}

@freezed
class Task with _$Task {
  const Task._();
  const factory Task({
    required int id,
    required int total,
    required int done,
  }) = _Task;

  double get progress => done.toDouble() / total;

  Task increment() => copyWith(done: done + 1);
}

Future<void> upsrtTask(Task task) {
  return db.rawInsert('''
    INSERT OR REPLACE INTO tasks (id, total, done)
    VALUES (?, ?, ?)
  ''', [task.id, task.total, task.done]);
}

Future<int?> getTotal(int id) async {
  final result = await db.rawQuery('''
    SELECT total FROM tasks WHERE id = ?
  ''', [id]);
  if (result.isEmpty) {
    return null;
  }
  return result.first['total'] as int;
}

Future<bool> taskIsDone(int id) async {
  final result = await db.rawQuery('''
    SELECT total, done FROM tasks WHERE id = ?
  ''', [id]);
  if (result.isEmpty) {
    return false;
  }
  final row = result.first;
  return row['total'] == row['done'];
}

@riverpod
class Tasks extends _$Tasks {
  @override
  Future<Task?> build(int id) async {
    final result = await db.rawQuery('''
      SELECT total, done FROM tasks WHERE id = ?
    ''', [id]);
    final subscription =
        updateStrem.stream.listen((update) => updateTask(update));
    ref.onDispose(() => subscription.cancel());
    if (result.isEmpty) {
      return null;
    }
    final row = result.first;
    return Task(
      id: id,
      total: row['total'] as int,
      done: row['done'] as int,
    );
  }

  void updateTask(Update update) async {
    if (update.key.id == id) {
      if (state.value != null) {
        if (update.type == UpdateType.done) {
          state = AsyncValue.data(state.value!.increment());
        }
      } else {
        state = AsyncValue.data(Task(
          id: id,
          total: update.total,
          done: update.type == UpdateType.done ? 1 : 0,
        ));
      }
    }
  }
}
