import 'package:angular2/angular2.dart';
import 'dart:html';
import 'package:uuid/uuid.dart';
import 'package:untitled34/components/todo_cmp.dart';

@Component(selector: 'app')
@View(
    template: '''
    <section class="todoapp">
      <todo-cmp></todo-cmp>
    </section>
    ''',
    directives: const [CORE_DIRECTIVES, TodoComponent])
class App {}