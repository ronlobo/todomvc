library untitled34.component.todo_cmp;

import 'dart:html' show InputElement;

import 'package:angular2/angular2.dart';
import 'package:todomvc/services/todo_store.dart' show Todo, TodoStore;
import 'package:angular2/router.dart';

@Component(selector: 'todo-cmp', viewBindings: const [TodoStore])
@View(templateUrl: 'todo_cmp.html', directives: const [CORE_DIRECTIVES])

class TodoComponent {
  TodoStore todoStore;

  Router router;

  TodoComponent(this.todoStore, this.router) {
    router.subscribe((value) {
      print("Is todo component listening ?");
    });
  }

  addTodo(InputElement input) {
    if (input.value.trim().isNotEmpty) {
      todoStore.add(input.value);
      input.value = '';
    }
  }

  void cancelEditing(Todo todo) {
    todo.editing = false;
  }

  void saveEditing(Todo todo, String title) {
    todo.editing = false;

    if (title.isEmpty) {
      todoStore.remove(todo.uid);
    } else {
      todo.title = title;
    }
  }
}
