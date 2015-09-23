library todomvc.component.todo_cmp;

import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:todomvc/services/todo_store.dart' show Todo, TodoStore;

@Component(selector: 'todo-cmp', viewBindings: const [TodoStore])
@View(templateUrl: 'todo_cmp.html', directives: const [CORE_DIRECTIVES])
class TodoComponent {

  TodoStore todoStore;

  TodoComponent(this.todoStore, RouteParams routeParams) {
    todoStore.filter = routeParams.get('filter');
  }

  String get filter => todoStore.filter;

  addTodo(InputElement input) {
    if (input.value
        .trim()
        .isNotEmpty) {
      todoStore.add(input.value);
      input.value = '';
    }
  }

  focus(Todo todo, InputElement i) {
    todo.editing = true;
    i.setSelectionRange(i.selectionStart,i.selectionEnd);
  }

  void removeTodo(Todo todo) {
    todoStore.remove(todo.uid);
  }

  void toggleCompletion(Todo todo) {
    todoStore.toggleCompletion(todo.uid);
  }
}
