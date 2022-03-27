import 'package:dio/dio.dart';
import 'package:flutter_github_app/globals/api_urls.dart';
import 'package:flutter_github_app/models/repository.dart';
import 'package:flutter_github_app/models/search_results.dart';
import 'package:flutter_github_app/services/base_service.dart';
import 'package:flutter_github_app/services/mixins/network_service_mixin.dart';
import 'package:stacked/stacked.dart';

class SearchService extends BaseService<SearchResults>
    with ReactiveServiceMixin, NetworkServiceMixin {
  SearchService() {
    initRxModel(
      SearchResults(
        repoResults: [],
      ),
    );
    listenToReactiveValues([
      super.getRxModel(),
    ]);
  }

  Future<void> fetchRepositories({required String queryString}) async {
    Response? response = await networkService.getHttp(
      url: API_SEARCH_REPOS,
      queryParams: <String, dynamic>{'q': queryString},
    );
    if (response != null) {
      final List<dynamic> jsonList = response.data['items'] as List<dynamic>;
      setRxModelValue(
        SearchResults(
          repoResults: jsonList.map((e) => Repository.fromJson(e)).toList(),
        ),
      );
    }
  }

  void clearRepoList() {
    getRxModelValue().repoResults.clear();
  }
}
