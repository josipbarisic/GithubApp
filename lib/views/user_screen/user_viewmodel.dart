import 'package:flutter_github_app/app/app.router.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/models/user.dart';
import 'package:flutter_github_app/services/mixins/navigation_service_mixin.dart';
import 'package:flutter_github_app/services/mixins/user_service_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class UserViewModel extends ReactiveViewModel
    with UserServiceMixin, NavigationServiceMixin {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [userService];

  User get userData => userService.getRxModelValue().user;

  List<Repository> get userRepos => userService.getRxModelValue().userRepos;

  Future<void> init(User user) async {
    setBusy(true);
    userService.setUser(user);
    await userService.fetchUserData(userDataUrl: user.userDataUrl);
    await userService.fetchUserRepos(userReposUrl: user.reposUrl);
    setBusy(false);
  }

  void openProfileInBrowser() async => await launch(userData.profileUrl);

  void navigateBack() => navigationService.back();

  void navigateToRepoScreen(Repository repo) => navigationService
      .navigateTo(Routes.repoView, arguments: RepoViewArguments(repo: repo));
}
