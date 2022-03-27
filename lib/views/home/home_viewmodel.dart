import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/services/mixins/search_service_mixin.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel with SearchServiceMixin {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [searchService];

  List<Repository> get repoResults =>
      searchService.getRxModelValue().repoResults;

  bool _searchAnimated = false;

  bool get isSearchAnimated => _searchAnimated;

  set isSearchAnimated(bool animated) {
    _searchAnimated = animated;
    notifyListeners();
  }

  String _searchInput = '';

  String get searchInput => _searchInput;

  set searchInput(String animated) {
    _searchInput = animated;
    notifyListeners();
  }

  Future<void> fetchRepositories() async {
    setBusy(true);
    await searchService.fetchRepositories(queryString: searchInput);
    setBusy(false);
  }

  void clearSearchResults() {
    searchService.clearRepoList();
  }
}
