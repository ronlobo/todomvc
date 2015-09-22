import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:todomvc/components/todo_cmp.dart';
import 'package:uuid/uuid.dart';

@Component(selector: 'app')
@View(
    template: '''
    <section class="todoapp">
      <todo-cmp></todo-cmp>
    </section>
    <footer id="info">
      <p>Double-click to edit a todo.</p>
      <p>Under construction, source at
        <a href="https://github.com/ng2-dart-samples/todomvc">github.</a>
      </p>
    </footer>
    ''',
    directives: const [CORE_DIRECTIVES, TodoComponent])
class App {}
