library todomvc.services.todo_store;

import 'package:angular2/angular2.dart' show Injectable;
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'dart:html';


Storage get store => window.localStorage;

@Injectable()
class TodoStore {
  List<Todo> todos = [];
  String filter;

  TodoStore() {
    if (store['todomvc'] != null) {
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

  void remove(String uid) {
    todos.removeWhere((todo) => todo.uid == uid);
    saveTodos();
  }

  void removeCompleted() {
    todos.removeWhere((todo) => todo.completed);
    saveTodos();
  }

  List<Todo> getActive() => todos.where((todo) => !todo.completed).toList();

  List<Todo> getCompleted() => todos.where((todo) => todo.completed).toList();

  bool allCompleted() => todos.length == getCompleted().length;

  void setAllTo(bool completed) =>
      todos.forEach((Todo t) => t.completed = completed);

  void toggleCompletion(String uid) {
    Todo todo = todos.firstWhere((todo) => todo.uid == uid);
    todo.completed = !todo.completed;
    saveTodos();
  }

  saveEditing(Todo todo, String title) {
    todo.editing = false;

    if (title.isEmpty) {
      remove(todo.uid);
    } else {
      todo.title = title;
    }
    saveTodos();
  }

  saveTodos() => store['todomvc'] = toJson();

  loadTodos() {
    todos = JSON.decode(store['todomvc'])
        .map((json) => new Todo.fromJSON(json))
        .toList();
  }

  toJson() => JSON.encode(todos.map((t) => t.toJson()).toList());
}

class Todo {
  bool completed = false;
  String title;
  final String uid = new Uuid().v4();
  bool editing = false;

  Todo(this.title);

  Todo.fromJSON(Map json)
      :
        title = json['title'],
        completed = json['completed'];

  toJson() => {'title': title, 'completed': completed};
}