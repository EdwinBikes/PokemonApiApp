import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/config/config.dart';
import 'package:riverapp/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAd: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAd: null),
          Todo(
            id: _uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAd: DateTime.now(),
          ),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAd: null)
        ]);

  void addTodo() {
    state = [
      ...state,
      Todo(
          id: _uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAd: null)
    ];
  }
}
