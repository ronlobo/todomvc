library untitled34.component.todo_cmp;

import 'dart:html' show InputElement;

import 'package:angular2/angular2.dart';
import 'package:todomvc/services/todo_store.dart' show Todo, TodoStore;

@Component(selector: 'todo-cmp', viewBindings: const [TodoStore])
@View(templateUrl: 'todo_cmp.html', directives: const [CORE_DIRECTIVES])
class TodoComponent {
  TodoStore todoStore;

  TodoComponent(this.todoStore);

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
