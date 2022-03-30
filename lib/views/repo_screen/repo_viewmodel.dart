import 'package:flutter_github_app/app/app.router.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/models/user.dart';
import 'package:flutter_github_app/services/mixins/navigation_service_mixin.dart';
import 'package:flutter_github_app/services/mixins/repo_service_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoViewModel extends ReactiveViewModel
    with NavigationServiceMixin, RepoServiceMixin {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [repoService];

  Repository get repo => repoService.getRxModelValue().repo;

  List<User> get contributors => repoService.getRxModelValue().contributors;

  Future<void> init(Repository repo) async {
    setBusy(true);
    repoService.setRepo(repo);
    await repoService.fetchRepoContributors(
        contributorsUrl: repo.contributorsUrl);
    setBusy(false);
  }

  void openRepoInBrowser() async => await launch(repo.repoUrl);

  void navigateBack() => navigationService.back();

  void navigateToUserScreen(User owner) => navigationService
      .navigateTo(Routes.userView, arguments: UserViewArguments(user: owner));
}
