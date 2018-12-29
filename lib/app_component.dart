import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

// import 'src/todo_list/todo_list_component.dart';
import 'src/mark_entry/mark_entry_component.dart';
import 'src/mark_entry/mark_service.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    MarkEntryComponent,
  ],
  providers: [
    ClassProvider(MarkService),
    <dynamic>[materialProviders],
  ]
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
