library todomvc.component.todo_cmp;

import 'dart:html' show InputElement;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:todomvc/services/todo_store.dart' show Todo, TodoStore;

@Component(selector: 'todo-cmp', viewBindings: const [TodoStore])
@View(templateUrl: 'todo_cmp.html', directives: const [CORE_DIRECTIVES])
class TodoComponent {
  Router router;
  String filter;
  TodoStore todoStore;

  TodoComponent(this.todoStore, this.router) {
    router.parent.subscribe((String value) => filter = value);
  }

  List<Todo> get filteredTodos {
    switch (filter) {
      case 'completed':
        return todoStore.getCompleted();
      case 'active':
        return todoStore.getActive();
      default:
        return todoStore.todos;
    }
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
