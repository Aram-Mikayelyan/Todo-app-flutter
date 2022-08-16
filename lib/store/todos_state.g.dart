// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodosState on _TodosState, Store {
  Computed<List<Todo>>? _$completedTodosComputed;

  @override
  List<Todo> get completedTodos => (_$completedTodosComputed ??=
          Computed<List<Todo>>(() => super.completedTodos,
              name: '_TodosState.completedTodos'))
      .value;

  late final _$todosAtom = Atom(name: '_TodosState.todos', context: context);

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$completedAtom =
      Atom(name: '_TodosState.completed', context: context);

  @override
  List<Todo> get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(List<Todo> value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$_TodosStateActionController =
      ActionController(name: '_TodosState', context: context);

  @override
  void markAllAsCompleted() {
    final _$actionInfo = _$_TodosStateActionController.startAction(
        name: '_TodosState.markAllAsCompleted');
    try {
      return super.markAllAsCompleted();
    } finally {
      _$_TodosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCompleted() {
    final _$actionInfo = _$_TodosStateActionController.startAction(
        name: '_TodosState.deleteCompleted');
    try {
      return super.deleteCompleted();
    } finally {
      _$_TodosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTodo(int id) {
    final _$actionInfo = _$_TodosStateActionController.startAction(
        name: '_TodosState.deleteTodo');
    try {
      return super.deleteTodo(id);
    } finally {
      _$_TodosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTodo(int id, String? newTitle, String? newDesc, bool? completed) {
    final _$actionInfo = _$_TodosStateActionController.startAction(
        name: '_TodosState.updateTodo');
    try {
      return super.updateTodo(id, newTitle, newDesc, completed);
    } finally {
      _$_TodosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(String title, String? desc) {
    final _$actionInfo =
        _$_TodosStateActionController.startAction(name: '_TodosState.addTodo');
    try {
      return super.addTodo(title, desc);
    } finally {
      _$_TodosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
completed: ${completed},
completedTodos: ${completedTodos}
    ''';
  }
}
