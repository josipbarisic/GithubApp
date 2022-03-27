
import 'package:flutter/material.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/services/mixins/search_service_mixin.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel with SearchServiceMixin {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [searchService];

  bool firstUse = true;

  final FocusNode searchInputFocusNode = FocusNode();

  List<Repository> get repoResults =>
      searchService.getRxModelValue().repoResults;

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

  Future<void> fetchRepositories() async {
    if (searchInput.isEmpty || isBusy) return;
    if (firstUse) firstUse = false;
    setBusy(true);
    await searchService.fetchRepositories(queryString: searchInput);
    showSearchInput = false;
    searchInput = '';

    setBusy(false);
  }

  void clearSearchResults() {
    searchService.clearRepoList();
  }
}
