library untitled34.services.todo_store;

import 'package:angular2/angular2.dart' show Injectable;
import 'package:uuid/uuid.dart';

@Injectable()
class TodoStore {
  List<Todo> todos = [];

  void add(String title) => todos.add(new Todo(title));

  bool allCompleted() => todos.length == _getCompleted().length;

  void remove(String uid) => todos.removeWhere((todo) => todo.uid == uid);

  void removeCompleted() => todos.removeWhere((todo) => todo.completed);

  void setAllTo(bool completed) =>
      todos.forEach((Todo t) => t.completed = completed);

  void toggleCompletion(String uid) {
    Todo todo = todos.firstWhere((todo) => todo.uid == uid);
    todo.completed = !todo.completed;
  }

  List<Todo> _getCompleted() => todos.where((todo) => todo.completed).toList();
}

class Todo {
  bool completed = false;
  bool editing = false;
  String title;
  String uid = new Uuid().v4();

  Todo(this.title);

  void editTodo() { editing = true; }
}