library untitled34.component.todo_cmp;

import 'package:angular2/angular2.dart';

import 'package:untitled34/services/todo_store.dart' show Todo, TodoStore;
import 'dart:html' show InputElement;

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

  void stopEditing(Todo todo, String title) {
    todo.editing = false;

    if (title.isEmpty) {
      todoStore.remove(todo.uid);
    } else {
      todo.title = title;
    }
  }

  void cancelEditing(Todo todo) {
    todo.editing = false;
  }
}
