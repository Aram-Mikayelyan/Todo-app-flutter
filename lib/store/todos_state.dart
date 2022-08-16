import 'package:mobx/mobx.dart';

import '../models/models.dart';

part 'todos_state.g.dart';

class TodosState extends TodosStateSingleton {
  static final TodosState _singleton = TodosState._internal();
  factory TodosState() {
    return _singleton;
  }

  TodosState._internal();
}

class TodosStateSingleton = _TodosState with _$TodosState;

abstract class _TodosState with Store {
  @observable
  List<Todo> todos = [
    Todo(id: 1, title: 'asdasd', isCompleted: true),
    Todo(id: 2, title: 'asdasd', isCompleted: true),
    Todo(id: 3, title: 'asdasd'),
    Todo(id: 4, title: 'asdasd'),
  ];
  @observable
  List<Todo> completed = [];
  @computed
  List<Todo> get completedTodos =>
      todos.where((todo) => todo.isCompleted).toList();

  @action
  void markAllAsCompleted() {
    todos = todos.map((todo) {
      todo.isCompleted = true;
      return todo;
    }).toList();
  }

  @action
  void deleteCompleted() {
    todos = todos.where((todo) => !todo.isCompleted).toList();
  }

  @action
  void deleteTodo(int id) {
    todos = todos.where((todo) {
      return todo.id != id;
    }).toList();
  }

  @action
  void updateTodo(int id, String? newTitle, String? newDesc, bool? completed) {
    todos = todos.map((todo) {
      if (id == todo.id) {
        todo.title = newTitle ?? todo.title;
        todo.description = newDesc ?? todo.description;
        todo.isCompleted = completed ?? todo.isCompleted;
        return todo;
      }
      return todo;
    }).toList();
  }

  @action
  void addTodo(String title, String? desc) {
    final Todo newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: desc,
    );
    todos = [
      newTodo,
      ...todos,
    ];
  }
}
