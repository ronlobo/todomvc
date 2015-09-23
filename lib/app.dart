library todo_mvc.app;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:todomvc/components/todo_cmp.dart';

@Component(selector: 'app')
@View(
    template: '''
    <div class="github-fork-ribbon-wrapper right">
	    <div class="github-fork-ribbon">
		    <a href="https://github.com/ng2-dart-samples/todomvc">Fork me on GitHub</a>
	    </div>
    </div>
    <section class="todoapp">
			<router-outlet></router-outlet>
		</section>
		<footer class="info">
			<p>Double-click to edit a todo</p>
			<p>Created by <a href="https://github.com/kasperpeulen">Kasper Peulen</a></p>
			<p>Source at <a href="https://github.com/ng2-dart-samples/todomvc">github.</a></p>
			<p>Part of <a href="http://todomvc.com">TodoMVC</a></p>
		</footer>
    ''',
    directives: const [ROUTER_DIRECTIVES, CORE_DIRECTIVES, TodoComponent])
@RouteConfig(const [const Route(path: '/:filter', component: TodoComponent)])
class App {}
