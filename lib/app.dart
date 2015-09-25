library todo_mvc.app;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:todomvc/components/todo_cmp.dart';

@Component(selector: 'app')
@View(templateUrl: 'app.html', directives: const [ROUTER_DIRECTIVES])
@RouteConfig(const [const Route(path: '/:filter', component: TodoComponent)])
class App {}
