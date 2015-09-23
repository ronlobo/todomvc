library todomvc.services.todo_store;

import 'dart:convert';
import 'dart:html';

import 'package:angular2/angular2.dart' show Injectable;
import 'package:uuid/uuid.dart';

@Injectable()
class TodoStore {
  List<Todo> todos = [];
  String filter;
  Storage get store => window.localStorage;

  TodoStore() {
    if (store['todos-angular2-dart'] != null) {
      loadTodos();
    }
  }

  List<Todo> get filteredTodos {
    switch (filter) {
      case 'completed':
        return getCompleted();
      case 'active':
        return getActive();
      default:
        return todos;
    }
  }

  void add(String title) {
    todos.add(new Todo(title));
    saveTodos();
  }

  bool allCompleted() => todos.length == getCompleted().length;

  List<Todo> getActive() => todos.where((todo) => !todo.completed).toList();

  List<Todo> getCompleted() => todos.where((todo) => todo.completed).toList();

  void loadTodos() {
    todos = JSON
        .decode(store['todos-angular2-dart'])
        .map((json) => new Todo.fromJSON(json))
        .toList();
  }

  void remove(String uid) {
    todos.removeWhere((todo) => todo.uid == uid);
    saveTodos();
  }

  void removeCompleted() {
    todos.removeWhere((todo) => todo.completed);
    saveTodos();
  }

  void saveEditing(Todo todo, String title) {
    todo.editing = false;

    if (title.isEmpty) {
      remove(todo.uid);
    } else {
      todo.title = title;
    }
    saveTodos();
  }

  void saveTodos() {
    store['todos-angular2-dart'] = JSON.encode(todos);
  }

  void setAllTo(bool completed) =>
      todos.forEach((Todo t) => t.completed = completed);

  void toggleCompletion(String uid) {
    Todo todo = todos.firstWhere((todo) => todo.uid == uid);
    todo.completed = !todo.completed;
    saveTodos();
  }
}

class Todo {
  bool completed = false;
  String title;
  final String uid = new Uuid().v4();
  bool editing = false;

  Todo(this.title);

  Todo.fromJSON(Map json)
      : title = json['title'],
        completed = json['completed'];

  Map toJson() => {'title': title, 'completed': completed};
}
