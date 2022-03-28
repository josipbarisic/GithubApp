import 'package:flutter/material.dart';
import 'package:flutter_github_app/app/app.router.dart';
import 'package:flutter_github_app/models/enums/repo_sort.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/models/user.dart';
import 'package:flutter_github_app/services/mixins/navigation_service_mixin.dart';
import 'package:flutter_github_app/services/mixins/search_service_mixin.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel
    with SearchServiceMixin, NavigationServiceMixin {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [searchService];

  bool firstUse = true;

  final FocusNode searchInputFocusNode = FocusNode();

  List<Repository> get repoResults =>
      searchService.getRxModelValue().repoResults;

  List<Repository> get sortedRepoResults {
    List<Repository> repoListReplacement = List<Repository>.from(repoResults);
    switch (RepoSort.values.firstWhere((sort) => sort.name == sortValue)) {
      case RepoSort.mostStars:
        repoListReplacement
            .sort((a, b) => b.numberOfStars.compareTo(a.numberOfStars));
        break;
      case RepoSort.fewestStars:
        repoListReplacement
            .sort((a, b) => a.numberOfStars.compareTo(b.numberOfStars));
        break;
      case RepoSort.mostForks:
        repoListReplacement
            .sort((a, b) => b.numberOfForks.compareTo(a.numberOfForks));
        break;
      case RepoSort.fewestForks:
        repoListReplacement
            .sort((a, b) => a.numberOfForks.compareTo(b.numberOfForks));
        break;
      case RepoSort.recentlyUpdate:
        repoListReplacement.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
      case RepoSort.leastRecentlyUpdate:
        repoListReplacement.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
        break;
      default:
        return repoResults;
    }
    return repoListReplacement;
  }

  bool _searchAnimated = false;

  bool get isSearchAnimated => _searchAnimated;

  set isSearchAnimated(bool animated) {
    _searchAnimated = animated;
    notifyListeners();
  }

  bool _showSearchInput = true;

  bool get showSearchInput => _showSearchInput;

  set showSearchInput(bool show) {
    _showSearchInput = show;
    notifyListeners();
  }

  String _searchInput = '';

  String get searchInput => _searchInput;

  set searchInput(String input) {
    _searchInput = input;
    notifyListeners();
  }

  String? _sortValue = RepoSort.bestMatch.name;

  String? get sortValue => _sortValue;

  set sortValue(String? sortValue) {
    _sortValue = sortValue;
    notifyListeners();
  }

  Future<void> fetchRepositories() async {
    if (searchInput.isEmpty || isBusy) return;
    if (firstUse) firstUse = false;
    setBusy(true);
    await searchService.fetchRepositories(queryString: searchInput);
    if (repoResults.isNotEmpty) showSearchInput = false;
    searchInput = '';

    setBusy(false);
  }

  void changeSortValue(String? sort) => sortValue = sort;

  void navigateToUserScreen(User owner) => navigationService
      .navigateTo(Routes.userView, arguments: UserViewArguments(user: owner));
}
