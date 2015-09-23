library todo_mvc.app;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:todomvc/components/todo_cmp.dart';

@Component(selector: 'app')
@View(
    template: '''
    <a href="https://github.com/ng2-dart-samples/todomvc"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>
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
