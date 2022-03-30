import 'package:flutter_github_app/views/repo_screen/repo_view.dart';
import 'package:flutter_github_app/views/user_screen/user_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  CupertinoRoute(page: UserView),
  CupertinoRoute(page: RepoView),
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
