library todo_mvc.app;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:todomvc/components/todo_cmp.dart';

@Component(selector: 'app')
@View(
    template: '''
    <section class="todoapp">
       <router-outlet></router-outlet>
    </section>
    <footer id="info">
      <p>Double-click to edit a todo.</p>
      <p>Under construction, source at
        <a href="https://github.com/ng2-dart-samples/todomvc">github.</a>
      </p>
    </footer>
    ''',
    directives: const [ROUTER_DIRECTIVES, CORE_DIRECTIVES, TodoComponent])
@RouteConfig(const [
  const Route(path: '/', component: TodoComponent, as: 'all'),
  const Route(path: '/active', component: TodoComponent, as: 'active'),
  const Route(path: '/completed', component: TodoComponent, as: 'completed'),
])
class App {}
